class CreateModerators < ActiveRecord::Migration
  def self.up
    create_table :moderators do |t|
    end
  end

  def self.down
    drop_table :moderators
  end
end
