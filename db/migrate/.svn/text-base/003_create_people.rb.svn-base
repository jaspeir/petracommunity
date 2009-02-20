class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.column :type, :string
      t.column :account_id, :integer
    end
  end

  def self.down
    drop_table :people
  end
end
