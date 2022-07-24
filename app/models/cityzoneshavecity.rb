class Cityzoneshavecity < ApplicationRecord
belongs_to :cityzone
belongs_to :city
validates_uniqueness_of :city_id, scope: :cityzone_id
end