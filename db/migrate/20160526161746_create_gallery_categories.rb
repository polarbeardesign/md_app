class CreateGalleryCategories < ActiveRecord::Migration
  def change
    create_table :gallery_categories do |t|
      t.string :category_name
      t.string :description

      t.timestamps
    end
  end
end
