class CreateHemats < ActiveRecord::Migration[5.2]
  def change
    # Hematocrit table
    create_table :hemats do |t|
      t.integer :animal_id, null: false, index: true
      t.decimal :mean, null: false
      t.decimal :standard_deviation, null: false
      t.integer :sample_size, null: false
      t.integer :number_of_studies, null: false

      # optional
      t.decimal :body_weight, null: true
      t.string :age, null: true
      t.string :reference_string, null: true
    end
  end
end
