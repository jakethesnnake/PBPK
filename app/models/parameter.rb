class Parameter < ApplicationRecord
  has_many :parameters_animal
  has_many :animals, through: :parameters_animal

  def animal_list
    list = []
    Animal.all.each do |a|
      list << a if a.has_parameter_data?(self)
    end
    list
  end
end
