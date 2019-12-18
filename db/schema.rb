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

ActiveRecord::Schema.define(version: 2019_12_17_011805) do

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

  create_table "organs", force: :cascade do |t|
    t.string "name", null: false
    t.integer "parent_id"
  end

  create_table "parameters", force: :cascade do |t|
    t.string "name"
  end

  create_table "parameters_animals", force: :cascade do |t|
    t.integer "parameter_id", null: false
    t.integer "animal_id", null: false
    t.index ["animal_id"], name: "index_parameters_animals_on_animal_id"
    t.index ["parameter_id"], name: "index_parameters_animals_on_parameter_id"
  end

  create_table "publications", force: :cascade do |t|
    t.integer "year", null: false
    t.integer "reference_number"
    t.index ["reference_number"], name: "index_publications_on_reference_number", unique: true
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
  end

end
