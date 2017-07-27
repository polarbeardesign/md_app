class SocialBrand < ActiveRecord::Base
  belongs_to :social_link
  has_one :social_link
  attr_accessible :brand_icon, :social_brand_name
end
