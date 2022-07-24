class Catshavecat < ApplicationRecord
belongs_to :category
belongs_to :othercategory, class_name: "Category"
validates_uniqueness_of :category_id, scope: :othercategory_id
end