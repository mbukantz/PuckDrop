class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.integer :games
      t.integer :goals
      t.integer :assists
      t.integer :points
      t.integer :plus_minus
      t.float :atoi
      t.integer :pims
      t.integer :wins
      t.integer :losses
      t.float :gaa
      t.integer :saves
      t.integer :shots
      t.integer :shutouts
      t.integer :player_id
      t.integer :year_id

      t.timestamps null: false
    end
  end
end
