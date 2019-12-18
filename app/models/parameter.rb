class Parameter < ApplicationRecord
  has_many :parameters_animal
  has_many :animals, through: :parameters_animal
end
