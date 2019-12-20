class Parameter < ApplicationRecord
  has_many :parameters_animal
  has_many :animals, through: :parameters_animal

  # Public: returns a list of all animals associated with a given parameter
  def animal_list
    Animal.all.select{ |a| a.has_parameter_data?(self) }
  end
end
