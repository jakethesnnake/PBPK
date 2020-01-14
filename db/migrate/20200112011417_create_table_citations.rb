class CreateTableCitations < ActiveRecord::Migration[5.2]
  def change
    create_table :table_citations do |t|
      t.belongs_to :table, null: false
      t.belongs_to :citation, null: false
      t.integer :reference_number, null: true, index: true
      t.string :volume, null: true
    end
  end
end
