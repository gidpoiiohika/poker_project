class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name, null: false, default: ""
      t.decimal :points_qual, precision: 9, scale: 5
      t.decimal :prize_pool, precision: 9
      t.decimal :buy_in, precision: 9
      t.integer :entrants, null: false
      t.datetime :date

      t.timestamps
    end
  end
end
