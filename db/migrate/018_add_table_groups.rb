class AddTableGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
        t.column :title, :string
        t.column :moderator_id, :integer
        t.column :type, :string
        t.column :created_at, :datetime
        t.column :updated_at, :datetime
    end
    
    create_table :accounts_groups, :id => false do |t|
      t.column :account_id, :integer
      t.column :group_id, :integer
    end
  end

  def self.down
    drop_table :groups
    drop_table :accounts_groups
  end
end
