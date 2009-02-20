class CreateFriendships < ActiveRecord::Migration
  def self.up
    create_table :friendships do |t|
      t.column :account_id, :integer
      t.column :friend_id, :integer
      t.column :status, :string
      t.column :created_at, :datetime
      t.column :accepted_at, :datetime
      t.column :updated_at, :datetime
    end
  end

  def self.down
    drop_table :friendships
  end
end
