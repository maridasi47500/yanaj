class Topic < ApplicationRecord
has_many :newshavetopics
has_many :news, through: :newshavetopics
has_many :eventshavetopics
has_many :events, through: :eventshavetopics
has_many :topiccats
has_many :links
validates_presence_of :name
has_many :testimonials
before_validation :saveurl
def saveurl
self.name||=self.title
self.url=self.name.parameterize

end
end