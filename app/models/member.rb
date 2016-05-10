class Member < ActiveRecord::Base

  belongs_to :user
  accepts_nested_attributes_for :user, :allow_destroy => true

  scope :active, where("members.active = 1")
  scope :inactive, where("members.active = 0")

  scope :ordered, order("active DESC, members.last_name ASC, members.first_name ASC")

  def full_name
    self.last_name + ', ' + self.first_name
  end


end
