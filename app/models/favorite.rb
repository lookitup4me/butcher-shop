class Favorite < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  has_one :cut, :dependent => :destroy
  belongs_to :user

  validates :name, :presence => true
  validates :cut, :presence => true
end
