class Photo < ActiveRecord::Base

  belongs_to :gallery
  belongs_to :photographer

  mount_uploader :image, ImageUploader
  
end
