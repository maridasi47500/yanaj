require "nokogiri"
require "open-uri"

def savethisplan(urlplan,saveplan=false,excerpt=nil,myimage=nil)
urlplan=!urlplan.include?('http') ? ("https://www.yana-j.fr"+urlplan) : urlplan
doc=Nokogiri::HTML(URI.open(urlplan))
plan=Plan.find_or_initialize_by(title: doc.css('h1').text.strip.squish)
plan.image=myimage
plan.mycontent=excerpt
plan.intro=doc.css('.lead-paragraph').inner_html
plan.description=doc.css('.content-teaser').inner_html
plan.readmore=doc.css('.js-teaser-content').inner_html.split('<button')[0] if doc.css('.js-teaser-content')
plan.save
listaddresses=doc.css('.zone-content')
doc.css('.zone-head').each_with_index do |zone,y|
zone.css('span').each do |h|
cityzone=Cityzone.find_or_create_by(name: h.text.strip.squish.split(':')[0])
cities=h.css('strong')[0].text.strip.squish.split(', ').map{|x|City.find_or_create_by(name: x)}
begin
cityzone.cities << cities
rescue =>e
p e.message
end
begin
plan.cityzones << cityzone
rescue =>e
p e.message
end
p y
@mylist=listaddresses
@list=listaddresses[y]
listaddresses[y].css('[data-addr]').each do |addr|
infosname=addr.css('use').map{|g|g.attributes['xlink:href'].value.split('#')[1]}
infos=addr.css('use').map{|g|g.parent.parent.parent.text.strip.squish}
infohash=infosname.zip(infos).to_h
myaddress=addr.css('.zone-localisation')[0]
cityzip=myaddress ? myaddress.css('span').last.text : nil
mystreet=myaddress ? myaddress.css('span')[0..-2].map(&:text).join(', ') : nil
zip=cityzip ? cityzip.split(' ')[0] : nil
city=cityzip && zip ? cityzip.gsub(zip,'') : nil
address=Address.new do |t|
t.cityzone_id=cityzone.id
t.place=addr.css('h4')[0].text
t.street=mystreet
t.zip=zip
t.city=city
t.phone1=addr.attributes['data-phone_1'].value
t.phone2=addr.attributes['data-phone_2'].value
t.email=infohash['icn_email']
t.schedule=addr.css('.schedule').text
t.latitude=addr.attributes['data-lat'].value
t.longitude=addr.attributes['data-lng'].value
end
address.save
plan.addresses << address
end


end
end
if saveplan
plan.otherplans << doc.css('.dispositif-wrapper').map{|x|savethisplan(x.css('a')[0].attributes['href'].value,false)}
end
plan.videos << doc.css('#player').map{|x|Video.find_or_create_by(videoid: x.attributes['data-video-id'].value)}
plan
rescue => e
p e.message
plan
end

def save_plans
urls=["https://www.yana-j.fr/dispositif/service-national-universel/"]

urls.each do |url|
savethisplan(url,true)
end
end