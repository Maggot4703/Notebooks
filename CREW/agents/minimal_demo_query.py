# Minimal, framework-free agent-to-agent query example

class ResearcherAgent:
    def handle_query(self, query: str) -> str:
        if "policy" in query.lower():
            return "Latest travel policy: All crew must check in before departure."
        return f"Researcher received: {query}"

class TravellerAgent:
    def __init__(self, researcher_agent):
        self.researcher_agent = researcher_agent

    def ask_researcher(self, query: str):
        response = self.researcher_agent.handle_query(query)
        with open("NOTEBOOKS/notebooks.txt", "a") as log:
            log.write(f"Query to Researcher: {query}\nResponse: {response}\n---\n")
        return response

if __name__ == "__main__":
    researcher = ResearcherAgent()
    traveller = TravellerAgent(researcher)
    result = traveller.ask_researcher("What are the latest travel policy changes?")
    print(result)
