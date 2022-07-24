class CreateEventshaveevents < ActiveRecord::Migration[6.0]
  def change
    create_table :eventshaveevents do |t|
      t.integer :event_id
      t.integer :otherevent_id
    end
  end
end
