class Cityzone < ApplicationRecord
has_many :cityzoneshavecities
has_many :cities, :through => :cityzoneshavecities

end