class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.integer :year, null: false
      t.integer :reference_number, null: true
    end
    add_index :publications, :reference_number, unique: true
  end
end
