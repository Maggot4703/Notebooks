class ResearcherAgent:
    def handle_query(self, query: str) -> str:
        # Example: simple response logic
        if "policy" in query.lower():
            return "Latest travel policy: All crew must check in before departure."
        return f"Researcher received: {query}"
