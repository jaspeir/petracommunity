class AddPicturesApprovedAtFrom < ActiveRecord::Migration
  def self.up
    add_column :pictures, :approved_at, :date
    add_column :pictures, :approved_from, :integer
  end

  def self.down
    remove_column :pictures, :approved_at
    remove_column :pictures, :approved_from
  end
end
