class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :hometeam
      t.string :awayteam
      t.datetime :date
      t.integer :homegoals
      t.integer :awaygoals
      t.integer :league_id
      t.integer :hometeam_league_id
      t.integer :awayteam_league_id
      t.timestamps null: false
    end
  end
end
