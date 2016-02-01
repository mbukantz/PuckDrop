class CreateHeadlines < ActiveRecord::Migration
  def change
    create_table :headlines do |t|
      t.string :name
      t.string :picture
      t.string :body
      t.integer :league_id
    end
  end
end
