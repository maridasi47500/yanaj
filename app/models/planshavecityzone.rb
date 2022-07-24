class Planshavecityzone < ApplicationRecord
belongs_to :cityzone
belongs_to :plan
validates_uniqueness_of :plan_id, scope: :cityzone_id
end