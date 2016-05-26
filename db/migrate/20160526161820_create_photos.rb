class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :gallery
      t.string :credit
      t.string :photo_title
      t.string :description
      t.string :image
      t.integer :position

      t.timestamps
    end
  end
end
