class CreateWeights < ActiveRecord::Migration[5.2]
  def change
    create_table :weights do |t|
      t.integer :organ_id, null: false
      t.integer :animal_id, null: false
      t.integer :parameter_id, null: false, default: 1, index: true

      # empty categories can be added
      t.decimal :mean, null: true
      t.decimal :standard_deviation, null: true
      t.integer :sample_size, null: true
      t.integer :number_of_studies, null: true

      # optional
      t.string :reference_string, null: true
      t.string :t_test, null: true

      # (hemat)
      t.decimal :body_weight, null: true
      t.string :age, null: true

      # sex
      t.decimal :mean_male, null: true
      t.decimal :mean_female, null: true

      # range
      t.string :range, null: true

      # production class
      t.string :production_class, null: true
    end
  end
end
