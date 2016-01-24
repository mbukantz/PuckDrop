class CreateStandings < ActiveRecord::Migration
  def change
    create_table :standings do |t|
      t.integer :team_id
      t.integer :year_id
      t.timestamps null: false
    end
  end
end
