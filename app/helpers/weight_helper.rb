module WeightHelper
  # Public: only for cardiac output parameter
  def has_production_class_info?(animal)
    return unless animal.is_a?(Animal)
    param = Parameter.find_by_id(2)
    weights = animal.weights_for_parameter(param)
    weights.each do |w|
      return true if w.production_class
    end
    false
  end

  def mean_info(weight)
    return unless weight.is_a?(Weight)
    return weight.mean if weight.mean

    male_mean = weight.mean_male
    female_mean = weight.mean_female

    return unless male_mean || female_mean

    if male_mean && female_mean
      "#{male_mean} (male); #{female_mean} (female)"
    elsif male_mean
      "#{male_mean} (male only)"
    else
      "#{female_mean} (female only)"
    end
  end
end
