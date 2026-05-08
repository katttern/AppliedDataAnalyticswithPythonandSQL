import requests
from bs4 import BeautifulSoup

hdr = {'User-Agent': 'Mozilla/5.0'}
r = requests.get('https://www.goodreads.com/', headers=hdr, timeout=10)

book_soup = BeautifulSoup(r.content, 'html.parser')
categories = book_soup.find_all('a', attrs={'class': 'gr-hyperlink'})

txt_categories = []
for tag in categories:
    if 'genres' in tag.get('href'):
        txt_categories.append(tag.string)

for category in txt_categories:
    print(category)
