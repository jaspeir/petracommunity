class CreateSpecFemales < ActiveRecord::Migration
  def self.up
    create_table :spec_females do |t|
      t.column :woman_id,    :integer
      t.column :breast_cup,   :string, :default => ''
    end
  end

  def self.down
    drop_table :spec_females
  end
end
