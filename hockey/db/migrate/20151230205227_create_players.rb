class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :birthday
      t.string :height
      t.string :weight
      t.string :shoots
      t.string :position
      t.string :city
      t.string :state
      t.string :country
      t.integer :team_id
      t.timestamps null: false
    end
  end
end
