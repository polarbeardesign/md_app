class Gallery < ActiveRecord::Base

  belongs_to :gallery_category
  belongs_to :media_type
  has_many :photos

  scope :ordered, order("galleries.created_at DESC")

end
