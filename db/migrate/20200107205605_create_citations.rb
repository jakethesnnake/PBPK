class CreateCitations < ActiveRecord::Migration[5.2]
  def change
    create_table :citations do |t|
      t.string :all_text
      t.integer :author_id, null: false, index: true
      t.integer :year, null: false, index: true
    end
  end
end
