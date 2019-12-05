class CreateOrgans < ActiveRecord::Migration[5.2]
  def change
    create_table :organs do |t|
      t.string :name, null: false
      t.integer :parent_id, null: true
    end
  end
end
