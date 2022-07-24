class AddExcerptToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :excerpt, :string
  end
end
