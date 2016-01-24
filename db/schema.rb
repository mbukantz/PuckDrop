# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160122193417) do

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.string   "commissioner"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "birthday"
    t.string   "height"
    t.string   "weight"
    t.string   "shoots"
    t.string   "position"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string   "hometeam"
    t.string   "awayteam"
    t.datetime "date"
    t.integer  "homegoals"
    t.integer  "awaygoals"
    t.integer  "league_id"
    t.integer  "hometeam_league_id"
    t.integer  "awayteam_league_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "standings", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statistics", force: :cascade do |t|
    t.integer  "games"
    t.integer  "goals"
    t.integer  "assists"
    t.integer  "points"
    t.integer  "plus_minus"
    t.float    "atoi"
    t.integer  "pims"
    t.integer  "wins"
    t.integer  "losses"
    t.float    "gaa"
    t.integer  "saves"
    t.integer  "shots"
    t.integer  "shutouts"
    t.integer  "player_id"
    t.integer  "year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "city"
    t.string   "name"
    t.string   "coach"
    t.string   "arena"
    t.integer  "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "years", force: :cascade do |t|
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
