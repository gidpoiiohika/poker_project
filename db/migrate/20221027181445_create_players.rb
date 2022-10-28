class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :full_name, null: false, default: ""
      t.decimal :points_qual, precision: 9
      t.decimal :prize_pool, precision: 9
      t.integer :place, null: false
      t.belongs_to :event, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
