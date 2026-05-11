from crewai.tools import BaseTool

class QueryResearcherSkill(BaseTool):
    name = "QueryResearcher"
    description = "Send a research query to the Researcher agent and return the response."

    def __init__(self, researcher_agent):
        self.researcher_agent = researcher_agent

    def _run(self, query: str, **kwargs):
        response = self.researcher_agent.handle_query(query)
        # Log the query and response
        with open("NOTEBOOKS/notebooks.txt", "a") as log:
            log.write(f"Query to Researcher: {query}\nResponse: {response}\n---\n")
        return response
