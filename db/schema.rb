# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_05_094139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_credits", force: :cascade do |t|
    t.bigint "game_id"
    t.string "personable_type"
    t.bigint "personable_id"
    t.boolean "is_used"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "amount", default: 0
    t.index ["game_id"], name: "index_game_credits_on_game_id"
    t.index ["personable_type", "personable_id"], name: "index_game_credits_on_personable_type_and_personable_id"
  end

  create_table "game_invitations", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.string "invitation_token"
    t.string "email"
    t.datetime "is_used_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_game_invitations_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "number_of_players"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "invitation_code"
    t.string "status"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "gift_attributions", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_gift_attributions_on_player_id"
  end

  create_table "gifts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "player_space_positions", force: :cascade do |t|
    t.bigint "space_id", null: false
    t.bigint "player_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "game_id", null: false
    t.index ["game_id"], name: "index_player_space_positions_on_game_id"
    t.index ["player_id"], name: "index_player_space_positions_on_player_id"
    t.index ["space_id"], name: "index_player_space_positions_on_space_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "color"
    t.bigint "user_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_players_on_game_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "space_skills", force: :cascade do |t|
    t.string "name"
    t.text "rule"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spaces", force: :cascade do |t|
    t.bigint "space_skill_id", null: false
    t.integer "position"
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_spaces_on_game_id"
    t.index ["space_skill_id"], name: "index_spaces_on_space_skill_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "fidmarques_uuid"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "game_credits", "games"
  add_foreign_key "game_invitations", "games"
  add_foreign_key "games", "users"
  add_foreign_key "gift_attributions", "players"
  add_foreign_key "player_space_positions", "games"
  add_foreign_key "player_space_positions", "players"
  add_foreign_key "player_space_positions", "spaces"
  add_foreign_key "players", "games"
  add_foreign_key "players", "users"
  add_foreign_key "spaces", "games"
  add_foreign_key "spaces", "space_skills"
end
