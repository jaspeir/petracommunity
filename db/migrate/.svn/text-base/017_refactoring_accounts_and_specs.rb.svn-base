class RefactoringAccountsAndSpecs < ActiveRecord::Migration
  def self.up
    add_column :invitations, :invited_account_id, :integer
    drop_table :moderators
    drop_table :people
    add_column :pictures, :album_id, :integer
    add_column :preferences, :account_id, :integer
    add_column :spec_generals, :breast_cup, :string, :default => ""
    rename_column :spec_generals, :person_id, :account_id
    add_column :spec_generals, :gender, :string
    add_column :spec_generals, :penis_length, :decimal, :precision => 3, :scale => 1, :default => 0.0
    add_column :spec_generals, :penis_diameter, :decimal, :precision => 3, :scale => 1, :default => 0.0
    drop_table :spec_males
    drop_table :spec_females
    rename_table :spec_generals, :specs
  end

  def self.down
    remove_column :invitations, :invited_account_id
    
    create_table "moderators", :force => true do |t|
    end
    
    create_table "people", :force => true do |t|
      t.column "type",       :string
      t.column "account_id", :integer
    end
    remove_column :pictures, :album_id
    remove_column :preferences, :account_id
    remove_column :spec_generals, :breast_cup
    rename_column :spec_generals, :account_id, :person_id
    remove_column :spec_generals, :gender
    remove_column :spec_generals, :penis_length
    remove_column :spec_generals, :penis_diameter
    
    create_table "spec_males", :force => true do |t|
      t.column "man_id",         :integer
      t.column "penis_length",   :decimal, :precision => 3, :scale => 1, :default => 0.0
      t.column "penis_diameter", :decimal, :precision => 3, :scale => 1, :default => 0.0
    end
    
    create_table "spec_females", :force => true do |t|
      t.column "woman_id",   :integer
      t.column "breast_cup", :string,  :default => ""
    end
    rename_table :specs, :spec_generals
  end
end
