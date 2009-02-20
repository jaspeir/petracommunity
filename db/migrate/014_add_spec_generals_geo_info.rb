class AddSpecGeneralsGeoInfo < ActiveRecord::Migration
  def self.up
    add_column :spec_generals, :zip_code, :string
    add_column :spec_generals, :city, :string
    add_column :spec_generals, :street_adress, :string
    add_column :spec_generals, :latitude, :decimal, :precision => 10, :scale => 6, :default => 0
    add_column :spec_generals, :longitude, :decimal, :precision => 10, :scale => 6, :default => 0
  end

  def self.down
    remove_column :spec_generals, :zip_code
    remove_column :spec_generals, :city
    remove_column :spec_generals, :street_adress
    remove_column :spec_generals, :latitude
    remove_column :spec_generals, :longitude
  end
end
