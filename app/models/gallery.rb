class Gallery < ActiveRecord::Base

  belongs_to :gallery_category
  belongs_to :media_type

end
