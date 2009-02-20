class Friendship < ActiveRecord::Base
  belongs_to :account
  belongs_to :friend, :class_name => "Account", :foreign_key => "friend_id"
  validates_presence_of :account_id, :friend_id

  # Return true if the accounts are (possibly pending) friends.
  def self.exists?(account, friend)
    not find_by_account_id_and_friend_id(account, friend).nil?
  end
  
  # Record a pending friend request.
  def self.request(account, friend)
    unless account == friend or Friendship.exists?(account, friend)
      transaction do
        create(:account => account, :friend => friend, :status => 'pending')
        create(:account => friend, :friend => account, :status => 'requested')
      end
    end
  end
  
  # Accept a friend request.
  def self.accept(account, friend)
    transaction do
      accepted_at = Time.now
      accept_one_side(account, friend, accepted_at)
      accept_one_side(friend, account, accepted_at)
    end
  end
  
  # Delete a friendship or cancel a pending request.
  def self.breakup(account, friend)
    transaction do
      destroy(find_by_account_id_and_friend_id(account, friend))
      destroy(find_by_account_id_and_friend_id(friend, account))
    end
  end
  
  private
  
  # Update the db with one side of an accepted friendship request.
  def self.accept_one_side(account, friend, accepted_at)
    request = find_by_account_id_and_friend_id(account, friend)
    request.status = 'accepted'
    request.accepted_at = accepted_at
    request.save!
  end

end
