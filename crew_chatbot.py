import os
import glob
import argparse
import yaml
import json
from datetime import datetime
import requests

AGENTS_DIR = os.path.join(os.path.dirname(__file__), "../AI/agents/CREW")
CONFIG_PATH = os.path.join(os.path.dirname(__file__), "config.json")
LOG_PATH = os.path.join(os.path.dirname(__file__), "chatbot_session.log")


class CrewAgent:
    def __init__(self, name, role, summary, responsibilities, skills, llm_config=None):
        self.name = name
        self.role = role
        self.summary = summary
        self.responsibilities = responsibilities
        self.skills = skills
        self.llm_config = llm_config or {}

    @classmethod
    def from_markdown(cls, path, llm_config=None):
        with open(path, "r", encoding="utf-8") as f:
            content = f.read()
        # Parse YAML frontmatter
        if content.startswith("#"):
            parts = content.split("---", 2)
            if len(parts) >= 3:
                yaml_block = parts[1]
                meta = yaml.safe_load(yaml_block)
                return cls(
                    name=meta.get("name"),
                    role=meta.get("role"),
                    summary=meta.get("summary"),
                    responsibilities=meta.get("responsibilities", []),
                    skills=meta.get("skills", []),
                    llm_config=llm_config,
                )
        return None

    def reply(self, message, context=None):
        # Use LLM if configured, else fallback
        if self.llm_config and self.llm_config.get("enabled"):
            return self.llm_reply(message, context)
        return f"[{self.name}] {self.summary}\nSkills: {', '.join(self.skills)}\nYou said: {message}"

    def llm_reply(self, message, context=None):
        # OpenAI API (or compatible endpoint)
        api_key = self.llm_config.get("api_key")
        endpoint = self.llm_config.get(
            "endpoint", "https://api.openai.com/v1/chat/completions"
        )
        model = self.llm_config.get("model", "gpt-3.5-turbo")
        if not api_key:
            return "[LLM not configured: missing API key]"
        # Compose prompt with persona, summary, and context
        sys_prompt = f"You are {self.name}, a {self.role}. {self.summary}\nResponsibilities: {', '.join(self.responsibilities)}\nSkills: {', '.join(self.skills)}"
        chat_history = []
        if context:
            for turn in context:
                if "user" in turn:
                    chat_history.append({"role": "user", "content": turn["user"]})
                if "agent" in turn:
                    chat_history.append({"role": "assistant", "content": turn["agent"]})
        chat_history.append({"role": "user", "content": message})
        payload = {
            "model": model,
            "messages": ([{"role": "system", "content": sys_prompt}] + chat_history),
            "max_tokens": self.llm_config.get("max_tokens", 256),
            "temperature": self.llm_config.get("temperature", 0.7),
        }
        headers = {
            "Authorization": f"Bearer {api_key}",
            "Content-Type": "application/json",
        }
        try:
            resp = requests.post(endpoint, json=payload, headers=headers, timeout=20)
            resp.raise_for_status()
            data = resp.json()
            return data["choices"][0]["message"]["content"].strip()
        except Exception as e:
            return f"[LLM error: {e}]"


def load_agents(llm_config=None):
    agents = {}
    for path in glob.glob(os.path.join(AGENTS_DIR, "*.agent.md")):
        agent = CrewAgent.from_markdown(path, llm_config=llm_config)
        if agent:
            agents[agent.name.lower()] = agent
    return agents


def log_message(session_id, persona, user_msg, agent_msg):
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    with open(LOG_PATH, "a", encoding="utf-8") as f:
        f.write(f"[{timestamp}] ({session_id}) {persona} <User>: {user_msg}\n")
        f.write(f"[{timestamp}] ({session_id}) {persona} <Agent>: {agent_msg}\n")


def save_session(session_state, session_id):
    path = f"chatbot_session_{session_id}.json"
    with open(path, "w", encoding="utf-8") as f:
        json.dump(session_state, f, indent=2)


def load_session(session_id):
    path = f"chatbot_session_{session_id}.json"
    if os.path.exists(path):
        with open(path, "r", encoding="utf-8") as f:
            return json.load(f)
    return None

    parser = argparse.ArgumentParser(description="Crew Chatbot CLI")
    parser.add_argument(
        "--persona", type=str, help="Agent persona (e.g. Captain, Doctor)"
    )
    parser.add_argument(
        "--context-window", type=int, help="Context window size for chatbot session"
    )
    parser.add_argument("--load-session", type=str, help="Session ID to load")
    args = parser.parse_args()

    # Load config if present
    llm_config = {}
    if os.path.exists(CONFIG_PATH):
        with open(CONFIG_PATH, "r") as f:
            config = json.load(f)
        persona = config.get("persona", "captain")
        context_window = config.get("context_window", 10)
        llm_config = config.get("llm", {})
    else:
        persona = "captain"
        context_window = 10
        llm_config = {}

    # Override with CLI args if provided
    if args.persona:
        persona = args.persona
    if args.context_window:
        context_window = args.context_window

    agents = load_agents(llm_config=llm_config)
    persona_key = persona.lower()
    agent = agents.get(persona_key, list(agents.values())[0])

    # Session ID for logging and save/load
    session_id = datetime.now().strftime("%Y%m%d%H%M%S")
    session_state = {
        "persona": agent.name,
        "context_window": context_window,
        "history": [],
    }

    # Load previous session if requested
    if args.load_session:
        loaded = load_session(args.load_session)
        if loaded:
            session_state = loaded
            persona_key = session_state["persona"].lower()
            agent = agents.get(persona_key, agent)
            print(f"[Loaded session {args.load_session}]\n")

    print(
        f"[session_state] persona: {session_state['persona']}, context_window: {session_state['context_window']}"
    )
    print(f"Chatting with: {agent.name} ({agent.role})\n{agent.summary}\n---")

    help_text = (
        "Commands:\n"
        "  /help                Show this help message\n"
        "  /personas            List available personas\n"
        "  /switch <persona>    Switch to another persona\n"
        "  /save                Save session\n"
        "  /exit or /quit       Exit the chatbot\n"
    )

    while True:
        try:
            msg = input("You: ")
            if msg.strip().lower() in {"/exit", "/quit", "exit", "quit"}:
                print("Goodbye!")
                break
            if msg.strip().lower() == "/help":
                print(help_text)
                continue
            if msg.strip().lower() == "/personas":
                print("Available personas:")
                for k in sorted(agents.keys()):
                    print(f"  - {agents[k].name}")
                continue
            if msg.strip().lower().startswith("/switch "):
                new_persona = msg.strip().split(" ", 1)[1].lower()
                if new_persona in agents:
                    agent = agents[new_persona]
                    session_state["persona"] = agent.name
                    print(f"Switched to persona: {agent.name}\n{agent.summary}\n---")
                else:
                    print(f"Persona '{new_persona}' not found. Use /personas to list.")
                continue
            if msg.strip().lower() == "/save":
                save_session(session_state, session_id)
                print(f"Session saved as chatbot_session_{session_id}.json")
                continue
            # Maintain context window
            session_state["history"].append({"user": msg})
            if len(session_state["history"]) > session_state["context_window"]:
                session_state["history"] = session_state["history"][
                    -session_state["context_window"] :
                ]
            reply = agent.reply(msg, context=session_state["history"])
            print(reply)
            session_state["history"][-1]["agent"] = reply
            log_message(session_id, agent.name, msg, reply)
        except KeyboardInterrupt, EOFError:
            print("\nGoodbye!")
            break


if __name__ == "__main__":
    main()
