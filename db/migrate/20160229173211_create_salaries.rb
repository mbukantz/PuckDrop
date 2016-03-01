class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.integer :year_0
      t.integer :year_1
      t.integer :year_2
      t.integer :year_3
      t.integer :year_4
      t.integer :year_5
      t.integer :year_6
      t.integer :year_7
      t.integer :year_8
      t.integer :player_id

      t.timestamps null: false
    end
  end
end
