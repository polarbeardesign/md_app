class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :assignments, :dependent => :destroy
  accepts_nested_attributes_for :assignments

  has_many :roles, :through => :assignments

  has_one :member, :dependent => :destroy

  scope :member_ordered, joins(:member).merge(Member.ordered)

  def can?(action, resource)
    roles.includes(:rights).for(action, resource).any?
  end

end
