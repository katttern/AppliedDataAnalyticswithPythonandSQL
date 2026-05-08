from bs4 import BeautifulSoup
import requests

req = requests.get('https://www.wikipedia.org', headers={"User-Agent": "Mozilla/5.0"}, timeout=10)

soup = BeautifulSoup(req.content, "html.parser")

print(soup.prettify())
