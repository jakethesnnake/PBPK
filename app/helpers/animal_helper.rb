module AnimalHelper
  def animal_indent_class(animal)
    "child" if animal.is_child?
  end
end
