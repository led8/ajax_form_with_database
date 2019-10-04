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

ActiveRecord::Schema.define(version: 2019_10_04_145326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "label"
    t.text "modal_content"
    t.string "modal_header"
    t.string "answer_type"
    t.integer "order"
    t.bigint "question_id"
    t.text "value", default: [], array: true
    t.string "modal_request_icon"
    t.string "parameter"
    t.text "modal_request_content"
    t.boolean "modal_request", default: false
    t.string "modal_request_header"
    t.boolean "modal", default: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "privacy_notices", force: :cascade do |t|
    t.string "type_of_operation"
    t.string "organizer"
    t.string "collected_data"
    t.string "environment"
    t.boolean "shared_data", default: false
    t.text "reused_data"
    t.boolean "organizer_under_contract", default: false
    t.string "agency_name"
    t.text "data_tag"
    t.text "accessible_data"
    t.text "retained_data"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.integer "position"
    t.text "hint"
    t.string "hint_icon"
  end

  add_foreign_key "answers", "questions"
end
