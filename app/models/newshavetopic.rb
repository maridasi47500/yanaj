class Newshavetopic < ApplicationRecord
belongs_to :news
belongs_to :topic
validates_uniqueness_of :news_id, scope: :topic_id
end