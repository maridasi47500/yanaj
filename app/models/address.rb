class Address < ApplicationRecord
has_many :planshaveaddresses
has_many :plans, :through => :planshaveaddresses
belongs_to :cityzone
def fulladdress
street+" "+zip+" "+city
end
def street=(x)
write_attribute(:street,x.try(:strip).try(:squish))
end
def city=(x)
write_attribute(:city,x.try(:strip).try(:squish))
end
def zip=(x)
write_attribute(:zip,x.try(:strip).try(:squish))
end
def fullcity
zip+" "+city
end
end