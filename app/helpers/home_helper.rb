module HomeHelper
  # Public: evaluates the association between the parameter and the instance variable
  # if equal (or included), true. Otherwise, false.
  def checked(obj)
    return @animal == obj if obj.is_a?(Animal)
    return @parameter == obj if obj.is_a?(Parameter)
    return false unless @organs && @organs.count > 0
    return @organs.include?(obj) if obj.is_a?(Organ)
    raise Exception
  end

  def organs_from_animal_and_parameter(animal, parameter)
    return [] unless animal.is_a?(Animal) && parameter.is_a?(Parameter)
    animal.organs_for_parameter(parameter)
  end

  def organ_indent_class(organ)
    return "grandchild" if organ.is_grandchild?
    "child" if organ.is_child?
  end

  def filters_exist?
    @animal || @parameter
  end
end