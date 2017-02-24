class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :name
      t.integer :units_preference, null: false, default: 1
      t.decimal :height_meters
      t.decimal :weight_kilograms
      t.boolean :private_profile, null: false, default: false
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
  end
end
