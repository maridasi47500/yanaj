class Eventshavetopic < ApplicationRecord
belongs_to :event
belongs_to :topic
validates_uniqueness_of :event_id, scope: :topic_id

end