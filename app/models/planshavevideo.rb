class Planshavevideo < ApplicationRecord
belongs_to :plan
belongs_to :video
validates_uniqueness_of :plan_id, scope: :video_id

end