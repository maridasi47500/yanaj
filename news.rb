require "nokogiri"

require "open-uri"
def findnews(url,findothernews = false)
doc=Nokogiri::HTML(URI.open(url))
news=News.find_or_initialize_by(title: doc.css('h1')[0].text.squish.strip)
news.content=doc.css('.content').inner_html
news.image=doc.css('header')[0].css('img')[0].attributes['src'].value
news.excerpt=doc.css('.post-excerpt').text.strip.squish

news.save

news.topics << doc.css('.categories-list').map{|x|Topic.find_or_create_by(name: x.text.strip.squish)}
if findothernews
news.othernews << doc.css('article.w-full').map{|x|findnews(x.css('a')[0].attributes['href'].value, false)}

end
news
end

urls=["https://www.yana-j.fr/actualites-articles/droits-et-demarches/ta-question-nos-reponses-regulariser-ta-situation-et-travailler/"]

urls.each do |url|
findnews(url,true)
end