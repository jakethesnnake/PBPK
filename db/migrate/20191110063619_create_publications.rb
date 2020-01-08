class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.integer :year, null: false, index: true
      t.integer :reference_number, null: true, index: true
      t.integer :table_number, null: true, index: true
    end
  end
end
