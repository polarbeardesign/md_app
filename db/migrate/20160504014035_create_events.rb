class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :start
      t.datetime :end
      t.references :event_type
      t.string :title
      t.references :event_status
      t.references :location
      t.string :event_url
      t.string :contact_info
      t.text :details
      t.integer :entered_by
      t.string :graphic_address

      t.timestamps
    end
    add_index :events, :event_type_id
    add_index :events, :event_status_id
    add_index :events, :location_id
  end
end
