class PdfFile < ActiveRecord::Base

  attr_accessible :filename, :title
  mount_uploader :filename, PdfUploader

end
