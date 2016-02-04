class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :caption
      t.string :url
      t.string :short_url
      t.integer :league_id
      t.timestamps null: false
    end
  end
end
