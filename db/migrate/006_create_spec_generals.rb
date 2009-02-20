class CreateSpecGenerals < ActiveRecord::Migration
  def self.up
    create_table :spec_generals do |t|
      t.column :person_id,    :integer
      t.column :birth_date,   :date
      t.column :height,       :decimal, :precision => 3
      t.column :weigth,       :decimal, :precision => 3
      t.column :body_type,    :string, :default => 'n/a'
      t.column :eye_color,    :string, :default => 'n/a'
      t.column :hair_color,   :string, :default => 'n/a'
      t.column :hair_length,  :string, :default => 'n/a'
      t.column :body_hair,    :string, :default => 'n/a'
      t.column :pubic_hair,   :string, :default => 'n/a'
      t.column :sexuality,    :string, :default => 'n/a'
      t.column :glasses,      :boolean
      t.column :smoker,       :boolean
      t.column :tatoo,        :boolean
      t.column :piercing,     :boolean
      t.column :handicaped,   :boolean
      t.column :stds,         :boolean
      t.column :hiv,          :boolean
      t.column :phantasies,   :string, :default => 'n/a'
      t.column :description,  :string, :default => 'n/a'
    end
  end

  def self.down
    drop_table :spec_generals
  end
end
