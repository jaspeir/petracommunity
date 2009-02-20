class CreateSpecMales < ActiveRecord::Migration
  def self.up
    create_table :spec_males do |t|
      t.column :man_id,    :integer
      t.column :penis_length, :decimal, :precision => 3, :scale => 1, :default => 0
      t.column :penis_diameter, :decimal, :precision => 3, :scale => 1, :default => 0
    end
  end

  def self.down
    drop_table :spec_males
  end
end
