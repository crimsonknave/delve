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

ActiveRecord::Schema.define(:version => 20130115011231) do

  create_table "card_instances", :force => true do |t|
    t.integer  "card_id"
    t.integer  "character_id"
    t.integer  "draw_id"
    t.integer  "discard_id"
    t.integer  "game_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "charges"
    t.boolean  "active"
    t.integer  "order"
    t.boolean  "held"
  end

  create_table "cards", :force => true do |t|
    t.string   "type"
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
    t.integer  "order"
  end

  create_table "decks", :force => true do |t|
    t.integer  "game_id"
    t.string   "type"
    t.integer  "level"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "games", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "current_player_id"
  end

  create_table "tile_instances", :force => true do |t|
    t.integer  "game_id"
    t.integer  "tile_id"
    t.integer  "character_id"
    t.integer  "order"
    t.integer  "x"
    t.integer  "y"
    t.string   "top"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "tiles", :force => true do |t|
    t.boolean  "room"
    t.boolean  "north_exit"
    t.boolean  "east_exit"
    t.boolean  "south_exit"
    t.boolean  "west_exit"
    t.boolean  "encounter"
    t.integer  "level"
    t.boolean  "teleport"
    t.boolean  "start"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
