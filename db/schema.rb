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

ActiveRecord::Schema.define(version: 2020_01_12_011417) do

  create_table "animals", force: :cascade do |t|
    t.string "name", null: false
    t.integer "parent_id"
    t.index ["parent_id"], name: "index_animals_on_parent_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_authors_on_name"
  end

  create_table "citations", force: :cascade do |t|
    t.text "all_text"
    t.integer "author_id", null: false
    t.integer "year", null: false
    t.index ["author_id"], name: "index_citations_on_author_id"
    t.index ["year"], name: "index_citations_on_year"
  end

  create_table "organs", force: :cascade do |t|
    t.string "name", null: false
    t.integer "parent_id"
  end

  create_table "parameters", force: :cascade do |t|
    t.string "name"
  end

  create_table "table_citations", force: :cascade do |t|
    t.integer "table_id", null: false
    t.integer "citation_id", null: false
    t.integer "reference_number"
    t.string "volume"
    t.index ["citation_id"], name: "index_table_citations_on_citation_id"
    t.index ["reference_number"], name: "index_table_citations_on_reference_number"
    t.index ["table_id"], name: "index_table_citations_on_table_id"
  end

  create_table "tables", force: :cascade do |t|
    t.integer "parameter_id"
    t.integer "animal_id"
    t.integer "animal2_id"
    t.index ["animal2_id"], name: "index_tables_on_animal2_id"
    t.index ["animal_id"], name: "index_tables_on_animal_id"
    t.index ["parameter_id"], name: "index_tables_on_parameter_id"
  end

  create_table "weights", force: :cascade do |t|
    t.integer "organ_id", null: false
    t.integer "animal_id", null: false
    t.integer "parameter_id", default: 1, null: false
    t.decimal "mean"
    t.decimal "standard_deviation"
    t.integer "sample_size"
    t.integer "number_of_studies"
    t.string "reference_string"
    t.string "t_test"
    t.decimal "body_weight"
    t.string "age"
    t.decimal "mean_male"
    t.decimal "mean_female"
    t.string "range"
    t.string "production_class"
    t.index ["parameter_id"], name: "index_weights_on_parameter_id"
  end

end
