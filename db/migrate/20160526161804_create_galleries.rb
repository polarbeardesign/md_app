class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.references :gallery_category
      t.references :media_type
      t.string :gallery_name
      t.string :description
      t.string :gallery_pic

      t.timestamps
    end
  end
end
