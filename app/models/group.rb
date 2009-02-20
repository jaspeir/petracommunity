class Group < ActiveRecord::Base
  validates_uniqueness_of :title
  has_and_belongs_to_many :accounts
  has_one :moderator, :class_name => "Account", :foreign_key => "moderator_id"
end
