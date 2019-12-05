class CreateWeights < ActiveRecord::Migration[5.2]
  def change
    create_table :weights do |t|
      t.integer :organ_id, null: false
      t.integer :animal_id, null: false

      # empty categories can be added
      t.decimal :mean, null: true
      t.decimal :standard_deviation, null: true
      t.integer :sample_size, null: true
      t.integer :number_of_studies, null: true

      # list of reference numbers
      t.string :reference_string, null: true
    end
  end
end
