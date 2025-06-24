import requests

def main():
    url = "https://pokeapi.co/api/v2/pokemon/ditto"
    response = requests.get(url)
    
    if response.status_code == 200:
        data = response.json()
        name = data['name']
        types = [t['type']['name'] for t in data['types']]
        print(f"Nome: {name}")
        print("Tipos:", ", ".join(types))
    else:
        print("Erro ao buscar dados da API")

if __name__ == "__main__":
    main()
