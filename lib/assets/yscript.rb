require "nokogiri"
require "open-uri"
@doc=Nokogiri::HTML(URI.open("https://www.yana-j.fr/dispositif/le-reseau-de-bus-inter-urbain-tig/#1489"))
