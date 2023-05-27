# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_27_195306) do
  create_table "npis", force: :cascade do |t|
    t.string "number"
    t.integer "enumeration_type"
    t.string "taxonomy_code"
    t.string "taxonomy_group"
    t.string "taxonomy_description"
    t.string "taxonomy_state"
    t.string "taxonomy_license"
    t.boolean "taxonomy_primary"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "country"
    t.string "address_1"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
