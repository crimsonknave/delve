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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121130215349) do

  create_table "card_instances", :force => true do |t|
    t.integer  "card_id"
    t.integer  "character_id"
    t.integer  "draw_id"
    t.integer  "discard_id"
    t.integer  "game_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "cards", :force => true do |t|
    t.string   "type"
    t.integer  "order"
    t.integer  "level"
    t.text     "details"
    t.string   "name"
    t.integer  "dexterity"
    t.integer  "intelligence"
    t.integer  "wisdom"
    t.integer  "attack"
    t.integer  "defense"
    t.integer  "check_difficulty"
    t.string   "kind"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "characters", :force => true do |t|
    t.integer  "game_id"
    t.string   "name"
    t.integer  "health"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "games", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
