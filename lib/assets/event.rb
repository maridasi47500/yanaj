require "nokogiri"
require "open-uri"
def savethisevent(url, saveotherevents = false,excerpt=nil)
doc=Nokogiri::HTML(URI.open(url))
calendar=JSON.parse(doc.css('.atcb').inner_html.squish.strip)
p "mycalendar"
p calendar
event=Event.find_or_initialize_by(title: doc.css('h1').text.strip.squish)
event.content=doc.css('.event-content').inner_html.split("<div class=\"categories-list")[0]
    event.startdate=DateTime.strptime(calendar['dateStart'], '%m-%d-%Y').to_s.to_date
event.excerpt=excerpt
    event.image=doc.css('.event-header img')[0].attributes['src'].value
    event.starttime=calendar['timeStart']
    event.endtime=calendar['timeEnd']
    event.enddate=DateTime.strptime(calendar['dateEnd'], '%m-%d-%Y').to_s.to_date
event.save
event.topics << doc.css('.categories-list')[0].css('span').map{|x|Topic.find_or_create_by(name: x.text.squish.strip)}
if saveotherevents
event.otherevents << doc.css('article.card-event-wrapper').map{|x|savethisevent(x.css('a')[0].attributes['href'].value)}
end
event
end 
#urls=["https://www.yana-j.fr/evenement/recompense-des-bacheliers-de-louest-guyanais/"]

#
urls=(["https://www.yana-j.fr/agenda/"]+(2..35).map{|x|"https://www.yana-j.fr/agenda/page/#{x}"})
urls.each do |myurl|
doc=Nokogiri::HTML(URI.open(myurl))
doc.css('.event-title a').each do |a|
savethisevent(a.attributes['href'].value, true,a.parent.parent.css('.event-excerpt')[0].text)
rescue => e
p e.message
next
end
end