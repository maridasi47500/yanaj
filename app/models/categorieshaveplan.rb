class Categorieshaveplan < ApplicationRecord
belongs_to :category
belongs_to :plan
validates_uniqueness_of :category_id, scope: :plan_id
 
end