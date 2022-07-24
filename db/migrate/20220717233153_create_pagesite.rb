class CreatePagesite < ActiveRecord::Migration[6.0]
  def change
    create_table :pagesites do |t|
      t.string :title
      t.string :url
      t.timestamps
    end
  end
end
