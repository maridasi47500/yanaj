class Category < ApplicationRecord
has_many :categorieshaveplans

has_many :plans, through: :categorieshaveplans
has_many :catshavecats
has_many :othercategories, :through => :catshavecats, source: :othercategory
before_validation :saveurl
def saveurl
self.url=self.title.parameterize
end
def self.search(x)
s="%"+x.to_s.downcase.gsub(' ','%')+"%"
where('lower(title) like ? or lower(intro) like ? or lower(readmore) like ? or lower(description) like ?',s,s,s,s)
end
def myurl
Rails.application.routes.url_helpers.showcat_path(name: url)
end
end