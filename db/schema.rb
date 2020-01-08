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

ActiveRecord::Schema.define(version: 2020_01_07_205605) do

  create_table "animals", force: :cascade do |t|
    t.string "name", null: false
    t.integer "parent_id"
    t.index ["parent_id"], name: "index_animals_on_parent_id"
  end

  create_table "author_publications", force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "publication_id", null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "citations", force: :cascade do |t|
    t.string "all_text"
    t.integer "author_id", null: false
    t.integer "year", null: false
    t.index ["author_id"], name: "index_citations_on_author_id"
    t.index ["year"], name: "index_citations_on_year"
  end

  create_table "hemats", force: :cascade do |t|
    t.integer "animal_id", null: false
    t.decimal "mean", null: false
    t.decimal "standard_deviation", null: false
    t.integer "sample_size", null: false
    t.integer "number_of_studies", null: false
    t.decimal "body_weight"
    t.string "age"
    t.index ["animal_id"], name: "index_hemats_on_animal_id"
  end

  create_table "organs", force: :cascade do |t|
    t.string "name", null: false
    t.integer "parent_id"
  end

  create_table "parameters", force: :cascade do |t|
    t.string "name"
  end

  create_table "publications", force: :cascade do |t|
    t.integer "year", null: false
    t.integer "reference_number"
    t.integer "table_number"
    t.index ["reference_number"], name: "index_publications_on_reference_number"
    t.index ["table_number"], name: "index_publications_on_table_number"
    t.index ["year"], name: "index_publications_on_year"
  end

  create_table "weight_publications", force: :cascade do |t|
    t.integer "weight_id", null: false
    t.integer "publication_id", null: false
  end

  create_table "weights", force: :cascade do |t|
    t.integer "organ_id", null: false
    t.integer "animal_id", null: false
    t.decimal "mean"
    t.decimal "standard_deviation"
    t.integer "sample_size"
    t.integer "number_of_studies"
    t.string "reference_string"
    t.string "t_test"
    t.integer "parameter_id", default: 1
    t.index ["parameter_id"], name: "index_weights_on_parameter_id"
  end

end
