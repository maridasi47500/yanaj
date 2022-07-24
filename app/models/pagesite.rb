class Pagesite < ApplicationRecord
def self.search(x)
s="%"+x.to_s.downcase.gsub(' ','%')+"%"
where('lower(title) like ?',s)
end
def myurl
url

end
end
