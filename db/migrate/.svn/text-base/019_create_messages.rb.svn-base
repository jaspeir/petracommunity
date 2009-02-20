class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.column :subject, :string
      t.column :body, :string
      t.column :sender_id, :integer
      t.column :recipient_id, :integer
      t.column :read, :boolean
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.column :parent_id, :integer
      t.column :status_id, :integer
    end
  end

  def self.down
    drop_table :messages
  end
end
