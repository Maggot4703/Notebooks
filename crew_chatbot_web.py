"""
Flask Web Chat Interface for Crew Chatbot

- Uses crew_chatbot.py for backend logic
- Supports persona switching, chat history, and LLM replies
"""

import os
from flask import Flask, render_template_string, request, session, redirect, url_for
import uuid
import json
from crew_chatbot import load_agents, CONFIG_PATH, LOG_PATH

app = Flask(__name__)
app.secret_key = os.environ.get("FLASK_SECRET_KEY", str(uuid.uuid4()))

# Load config and agents
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


agents = load_agents(llm_config=llm_config)
if not agents:
    raise RuntimeError(
        "No agents loaded. Please check your configuration and ensure at least one agent is defined."
    )
default_agent = agents.get(persona.lower(), list(agents.values())[0])

CHAT_TEMPLATE = """
<!doctype html>
<title>Crew Chatbot Web</title>
<style>
body { font-family: sans-serif; background: #f4f4f4; }
#chatbox { width: 60vw; margin: 2em auto; background: #fff; padding: 2em; border-radius: 8px; box-shadow: 0 2px 8px #aaa; }
.msg { margin-bottom: 1em; }
.user { color: #333; }
.agent { color: #0a4; }
select, input[type=text] { font-size: 1em; }
</style>
<div id="chatbox">
  <h2>Crew Chatbot</h2>
  <form method="post" action="/switch">
    Persona:
    <select name="persona" onchange="this.form.submit()">
      {% for k, a in agents.items() %}
        <option value="{{a.name}}" {% if a.name == current_agent.name %}selected{% endif %}>{{a.name}}</option>
      {% endfor %}
    </select>
  </form>
  <div style="margin:1em 0; color:#666;">{{current_agent.summary}}</div>
  <div style="max-height:40vh; overflow-y:auto; border:1px solid #eee; padding:1em; background:#fafafa;">
    {% for turn in history %}
      <div class="msg user"><b>You:</b> {{turn['user']}}</div>
      {% if turn['agent'] %}<div class="msg agent"><b>{{current_agent.name}}:</b> {{turn['agent']}}</div>{% endif %}
    {% endfor %}
  </div>
  <form method="post" action="/">
    <input type="text" name="msg" autofocus style="width:80%" autocomplete="off"/>
    <button type="submit">Send</button>
  </form>
</div>
"""


def get_session_state():
    if "session_id" not in session:
        session["session_id"] = str(uuid.uuid4())
    if "persona" not in session:
        session["persona"] = default_agent.name
    if "history" not in session:
        session["history"] = []
    return session["session_id"], session["persona"], session["history"]


def save_session_state(session_id, persona, history):
    session["session_id"] = session_id
    session["persona"] = persona
    session["history"] = history


def log_message(session_id, persona, user_msg, agent_msg):
    from datetime import datetime

    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    with open(LOG_PATH, "a", encoding="utf-8") as f:
        f.write(f"[{timestamp}] ({session_id}) {persona} <User>: {user_msg}\n")
        f.write(f"[{timestamp}] ({session_id}) {persona} <Agent>: {agent_msg}\n")


@app.route("/", methods=["GET", "POST"])
def chat():
    session_id, persona, history = get_session_state()
    current_agent = agents.get(persona.lower(), default_agent)
    if request.method == "POST":
        msg = request.form.get("msg", "").strip()
        if msg:
            history.append({"user": msg})
            if len(history) > context_window:
                history = history[-context_window:]
            reply = current_agent.reply(msg, context=history)
            history[-1]["agent"] = reply
            log_message(session_id, current_agent.name, msg, reply)
            save_session_state(session_id, current_agent.name, history)
        return redirect(url_for("chat"))
    return render_template_string(
        CHAT_TEMPLATE, agents=agents, current_agent=current_agent, history=history
    )


@app.route("/switch", methods=["POST"])
def switch_persona():
    persona = request.form.get("persona", default_agent.name)
    session["persona"] = persona
    session["history"] = []
    return redirect(url_for("chat"))


if __name__ == "__main__":
    app.run(debug=True, port=5000)
