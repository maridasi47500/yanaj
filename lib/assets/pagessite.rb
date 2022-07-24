require "nokogiri"
require "open-uri"
@url="https://www.yana-j.fr"
@doc=Nokogiri::HTML(URI.open(@url+"/recherche/"))
@doc.css("#content-5-content").css("a").each do |link|
Pagesite.find_or_create_by({
:title => link.text.squish.strip,
:url => link.attributes["href"].value
})
end