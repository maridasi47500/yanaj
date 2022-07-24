class Planshaveaddress < ApplicationRecord
belongs_to :address
belongs_to :plan
validates_uniqueness_of :address_id, scope: :plan_id
end