import requests

def query_deepseek_chat(prompt, api_url="http://localhost:8000/chat"):
    response = requests.post(api_url, json={"prompt": prompt})
    response.raise_for_status()
    return response.json().get("response", "[No response]")

def query_deepseek_code(prompt, api_url="http://localhost:8001/code"):
    response = requests.post(api_url, json={"prompt": prompt})
    response.raise_for_status()
    return response.json().get("response", "[No response]")

# Example integration for Crew Manager
if __name__ == "__main__":
    user_input = input("Ask DeepSeek (chat): ")
    print("DeepSeek Chat:", query_deepseek_chat(user_input))
    user_input = input("Ask DeepSeek (code): ")
    print("DeepSeek Code:", query_deepseek_code(user_input))
