class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table "accounts", :force => true do |t|
      t.column :login,                      :string
      t.column :email,                      :string
      t.column :crypted_password,           :string, :limit => 40
      t.column :salt,                       :string, :limit => 40
      t.column :created_at,                 :datetime
      t.column :updated_at,                 :datetime
      t.column :remember_token,             :string
      t.column :remember_token_expires_at,  :datetime
      t.column :activation_code,            :string, :limit => 40
      t.column :activated_at,               :datetime      
      t.column :sponsor_id,                 :integer
      t.column :pm_sponsor_id,              :integer, :default => 0000
      t.column :pm_id,                      :integer, :default => 0815
      t.column :admin,                      :boolean, :default => false
    end
  end

  def self.down
    drop_table "accounts"
  end
end

