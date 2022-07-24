class Topiccat < ApplicationRecord
belongs_to :topic
validates_uniqueness_of :title, scope: :image
has_many :topiccatshavecategories
has_many :categories, through: :topiccatshavecategories
 
end