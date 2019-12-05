class CreateAuthorPublications < ActiveRecord::Migration[5.2]
  def change
    create_table :author_publications do |t|
      t.integer :author_id, null: false
      t.integer :publication_id, null: false
    end
  end
end
