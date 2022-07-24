class CreateCatshavecats < ActiveRecord::Migration[6.0]
  def change
    create_table :catshavecats do |t|
      t.integer :category_id
      t.integer :othercategory_id
    end
  end
end
