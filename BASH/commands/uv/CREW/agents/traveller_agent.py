from agents.researcher_agent import ResearcherAgent

from skills.query_researcher import QueryResearcherSkill

researcher_agent = ResearcherAgent()
query_researcher_skill = QueryResearcherSkill(researcher_agent)


class TravellerAgent:
    def __init__(self):
        self.tools = {"QueryResearcher": query_researcher_skill}

    def ask_researcher(self, query: str):
        return self.tools["QueryResearcher"]._run(query)
