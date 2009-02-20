class Preference < ActiveRecord::Base
  acts_as_ferret :remote => true
  belongs_to :account
end
