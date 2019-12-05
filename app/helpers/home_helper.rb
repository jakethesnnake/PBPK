module HomeHelper
  def checked(obj)
    return @animals.include?(obj) if obj.is_a?(Animal)
    return @organs.include?(obj) if obj.is_a?(Organ)
    return @parameters.include?(obj) if obj.is_a?(Parameter)
    raise Exception
  end

  def organ_indent_class(organ)
    return "grandchild" if organ.is_grandchild?
    "child" if organ.is_child?
  end

  def animal_indent_class(animal)
    "child" if animal.is_child?
  end
end