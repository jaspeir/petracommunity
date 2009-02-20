class AddAccountMainPicture < ActiveRecord::Migration
  def self.up
    add_column :accounts, :main_picture_id, :integer
  end

  def self.down
    remove_column :accounts, :main_picture_id
  end
end
