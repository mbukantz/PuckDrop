class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :city
      t.string :name
      t.string :coach
      t.string :arena
      t.integer :league_id

      t.timestamps null: false
    end
  end
end
