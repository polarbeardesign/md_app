class CreateSocialBrands < ActiveRecord::Migration
  def change
    create_table :social_brands do |t|
      t.string :social_brand_name
      t.string :brand_icon

      t.timestamps
    end
  end
end
