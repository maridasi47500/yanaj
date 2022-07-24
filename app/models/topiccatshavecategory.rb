class Topiccatshavecategory < ApplicationRecord
belongs_to :topiccat
belongs_to :category
validates_uniqueness_of :category_id, scope: :topiccat_id
end