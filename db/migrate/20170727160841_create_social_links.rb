class CreateSocialLinks < ActiveRecord::Migration
  def change
    create_table :social_links do |t|
      t.references :social_brand
      t.string :brand_url

      t.timestamps
    end
    add_index :social_links, :social_brand_id
  end
end
