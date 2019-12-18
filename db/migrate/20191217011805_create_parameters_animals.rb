class CreateParametersAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :parameters_animals do |t|
      t.belongs_to :parameter, null: false
      t.belongs_to :animal, null: false
    end
  end
end
