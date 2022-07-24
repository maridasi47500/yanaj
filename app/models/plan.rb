class Plan < ApplicationRecord
has_many :categorieshaveplans
has_many :categories, through: :categorieshaveplans

has_many :someotherplans
has_many :otherplans, through: :someotherplans, source: :otherplan
before_validation :saveurl
def saveurl
self.url=self.title.parameterize
end
def self.search(x)
s="%"+x.to_s.downcase.gsub(' ','%')+"%"
select("plans.*, (select count(distinct a.plan_id) from planshaveaddresses a left join addresses ad on ad.id = a.address_id group by a.address_id having lower(ad.place) like '#{s}') as nbaddresses").group("plans.id").having('lower(title) like ? or lower(intro) like ? or lower(readmore) like ? or lower(description) like ? or nbaddresses > 0',s,s,s,s)
end
def myurl
Rails.application.routes.url_helpers.plan_path(name: url)
end
has_many :planshavecityzones
has_many :cityzones, :through => :planshavecityzones
has_many :planshaveaddresses
has_many :addresses, :through => :planshaveaddresses

has_many :planshavevideos
has_many :videos, through: :planshavevideos
def intro=(x)
write_attribute(:intro,x.try(:strip).try(:squish))
end
def description=(x)
write_attribute(:description,x.try(:strip).try(:squish))
end
def readmore=(x)
write_attribute(:readmore,x.try(:strip).try(:squish))
end
end