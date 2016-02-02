class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :hometeam_id
      t.integer :awayteam_id
      t.integer :home_goals
      t.integer :away_goals
      t.integer :period
      t.float :time_remaining
      t.integer :hometeam_league_id
      t.integer :awayteam_league_id
      t.datetime :date
    end
  end
end
