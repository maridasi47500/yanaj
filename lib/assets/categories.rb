require "nokogiri"
require "open-uri"
require "./lib/assets/plan"
def findthiscategory(url,lookothercategories = false)
doc=Nokogiri::HTML(URI.open(url))
category=Category.find_or_initialize_by(title: doc.css("h1").text.strip.squish)
category.image=URI.extract(doc.css('.thumbnail')[0].attributes['style'].value)[1]
category.intro=doc.css('.lead-paragraph').inner_html
category.description=doc.css('.content-teaser').inner_html
category.readmore=doc.css('.js-teaser-content').inner_html.split('<button')[0] if doc.css('.js-teaser-content')
doc.css('.dispositif-head a').map do |x|
category.plans << savethisplan(x.attributes['href'].value,true,x.parent.parent.parent.css('.content-dispositif')[0].text,(x.parent.parent.parent.css('.dispositif-head img')[0].attributes['src'].value rescue nil))
rescue => e
p e.message
next
end
doc.css('.rubriques-list-wrapper').each do |rubrique|

if lookothercategories
rubrique.css('.rubrique').each do |mycat|
category.othercategories << findthiscategory(mycat.css('a')[0].attributes['href'].value ,false)
end
end
end
category.save
category
rescue => e
category
end

#urls=["https://www.yana-j.fr/categorie/etre-volontaire-en-guyane/"]
urls=Topic.all.map{|x|"https://www.yana-j.fr/thematique/"+x.url}
urls.each do |myurl|
doc=Nokogiri::HTML(URI.open(myurl))
doc.css('.categories-list li a').map{|h|h.attributes['href'].value}.each do |url|
findthiscategory(url, true)
end
end