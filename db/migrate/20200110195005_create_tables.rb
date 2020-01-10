class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.belongs_to :parameter
      t.belongs_to :animal
      t.integer :animal2_id, null: true, index: true
    end
  end
end
