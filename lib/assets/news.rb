require "nokogiri"

require "open-uri"
def findnews(url,findothernews = false)
doc=Nokogiri::HTML(URI.open(url))
news=News.find_or_initialize_by(title: doc.css('h1.post-title')[0].text.squish.strip)
news.content=doc.css('.content').inner_html
news.image=doc.css('.thumbnail-container img')[0].attributes['src'].value
news.excerpt=doc.css('.post-excerpt').text.strip.squish

news.save

news.topics << doc.css('.categories-list .category').map{|x|Topic.find_or_create_by(name: x.text.strip.squish)}
if findothernews
begin
news.othernews << doc.css('article.w-full').map{|x|findnews(x.css('a')[0].attributes['href'].value, false)}
rescue => e
end
end
news
end

#urls=["https://www.yana-j.fr/actualites-articles/droits-et-demarches/ta-question-nos-reponses-regulariser-ta-situation-et-travailler/"]
urls=(["https://www.yana-j.fr/actualites-articles/"]+(2..35).map{|x|"https://www.yana-j.fr/actualites-articles/page/#{x}"})
urls.each do |myurl|
doc=Nokogiri::HTML(URI.open(myurl))
doc.css('.post-homepage a').map{|h|h.attributes['href'].value}.each do |url|
findnews(url,true)
rescue => e
p e.message
next
end
end