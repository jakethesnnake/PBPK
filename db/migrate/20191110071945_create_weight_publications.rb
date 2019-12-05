class CreateWeightPublications < ActiveRecord::Migration[5.2]
  def change
    create_table :weight_publications do |t|
      t.integer :weight_id, null: false
      t.integer :publication_id, null: false
    end
  end
end
