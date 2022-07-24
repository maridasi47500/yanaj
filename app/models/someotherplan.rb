class Someotherplan < ApplicationRecord
belongs_to :plan
belongs_to :otherplan,class_name: "Plan"
validates_uniqueness_of :plan_id, scope: :otherplan_id
end