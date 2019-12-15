module HomeHelper
  # Public: evaluates the association between the parameter and the instance variable
  # if equal (or included), true. Otherwise, false.
  # <FRAGMENT>
  def checked(obj)
    return @animal == obj if obj.is_a?(Animal)
    return @parameter == obj if obj.is_a?(Parameter)
    return @organs.include?(obj) if obj.is_a?(Organ)
    raise Exception
  end

  # <TEMP>
  def get_organs
    @animal.try(:organs) || Organ.all
  end

  def organ_indent_class(organ)
    return "grandchild" if organ.is_grandchild?
    "child" if organ.is_child?
  end

  def animal_indent_class(animal)
    return "grandchild" if animal.is_grandchild?
    "child" if animal.is_child?
  end
end