class Someothernews < ApplicationRecord
belongs_to :news
belongs_to :othernews, class_name: "News"
validates_uniqueness_of :news_id, scope: :othernews_id
end