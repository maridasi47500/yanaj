class City < ApplicationRecord
has_many :cityzoneshavecities 
has_many :cityzones, :through => :cityzoneshavecities 
end