class Invitation < ActiveRecord::Base
  belongs_to :account
  belongs_to :invited_account, :class_name => "Account", :foreign_key => "invited_account_id"
  
  validates_uniqueness_of :invitation_token
  
  def create_token
    self.invitation_token = Digest::SHA1.hexdigest("#{email}:#{account_id}:#{Time.now}")
  end
end
