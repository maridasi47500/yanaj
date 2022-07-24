class CreateTestimonials < ActiveRecord::Migration[6.0]
  def change
    create_table :testimonials do |t|
      t.integer :topic_id
      t.text :content
      t.string :author
	t.timestamps
    end
  end
end
