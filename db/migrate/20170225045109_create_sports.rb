class CreateSports < ActiveRecord::Migration[5.0]
  def change
    create_table :sports do |t|
      t.integer :participation_hours, null: false, default: 0
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true

      t.string :name

      t.date :participation_date

      t.timestamps
    end
  end
end
