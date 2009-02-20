class AddSpecGeneralChilds < ActiveRecord::Migration
  def self.up
    add_column :spec_generals, :children, :boolean
    add_column :spec_generals, :children_wanted, :boolean
  end

  def self.down
    remove_column :spec_generals, :children
    remove_column :spec_generals, :children_wanted
  end
end
