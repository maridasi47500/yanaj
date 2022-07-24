require "nokogiri"
require "open-uri"

def savethistopic(url, lookothertopics = false)
doc=Nokogiri::HTML(URI.open(url))
topic=Topic.find_or_initialize_by(title: doc.css(".page-title").text.squish.strip)
topic.image=doc.css('.pro-content-container')[0].css('img')[0].attributes['src'].value
topic.content=doc.css('.details').inner_html
topic.save
topic.links << doc.css('.links-list')[0].css('a').map{|x|Link.find_or_create_by(topic_id: topic.id, url: x.attributes["href"].value, name: x.text.strip.squish)}
topic.topiccats << doc.css('.rubrique-head').map do |t| 
cat=Topiccat.find_or_create_by(topic_id: topic.id, title: t.css('h2').text.strip.squish, image: t.css('img')[0].attributes['src'].value)
@t=t
t.parent.css('.categories-list')[0].css('a').map{|h|Category.find_or_create_by(title: h.text.strip.squish)}.each do |u|
cat.categories << u
rescue => e
p e.message
end

cat
end
test_content=doc.css('.testimonial-content').map{|g|g.text.strip.squish}
test_author=doc.css('.testimonial-author').map{|g|g.text.strip.squish}
test_content.each_with_index do |h,hid|
topic.testimonials.find_or_create_by(content: h, author: test_author[hid])
end

topic.save

topic
end

#urls=["https://www.yana-j.fr/thematique/citoyennete-et-volontariat/"]
doc1=Nokogiri::HTML(URI.open('https://www.yana-j.fr'))
urls=doc1.css('.mobile-nav-container .menu-item').map{|x|x.attributes['href'].value}
urls.each do |url|
savethistopic(url, false)
rescue => e
p e.message
next
end