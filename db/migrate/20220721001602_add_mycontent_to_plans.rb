class AddMycontentToPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :plans, :mycontent, :string
  end
end
