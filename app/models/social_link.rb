class SocialLink < ActiveRecord::Base
  belongs_to :social_brand
  attr_accessible :id, :brand_url, :social_brand_id, :created_at, :updated_at
end
