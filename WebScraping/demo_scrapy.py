import scrapy
from scrapy.crawler import CrawlerRunner
import crochet

crochet.setup()

class BookSpider(scrapy.Spider):
    name='BookSpider'

    start_urls=['http://books.toscrape.com/catalogue/page-1.html',
                'http://books.toscrape.com/catalogue/page-2.html',
                'http://books.toscrape.com/catalogue/page-3.html']

    def parse(self, response):
        book_list=response.css('article.product_pod>h3>a::attr(title)').getall()

        for i in book_list:
            print(i)

process = CrawlerRunner({
    'USER_AGENT': 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)',
})
process.crawl(BookSpider)
