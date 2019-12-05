class Animal < ApplicationRecord
  validates :name, presence: true
  validates :parent_id, presence: true, numericality: true, allow_blank: true

  validate :valid_or_nil_parent

  # Public: returns animal parent or nil otherwise
  def parent
    Animal.find_by_id(parent_id)
  end

  # Public: returns all organs for animal (that have weights associated)
  # <TEST>
  def organs
    weights = organ_weights
    return unless weights.count > 0
    organs = []
    weights.each do |weight|
      organ = Organ.find_by_id(weight.organ_id.to_i)
      organs << organ
    end
    organs
  end

  # Public: returns true if organ has parent
  def is_child?
    parent_id.present?
  end

  # Public: returns all organ weights for animal
  def organ_weights
    Weight.where(animal_id: id)
  end

  # Public: returns all organ weights that correspond to the animal AND
  # are included in the parameter set
  # <TEST>
  def filtered_weights(filter_organs)
    raise Exception unless organ_weights.count > 0
    final = []
    organ_weights.each do |weight|
      organ = Organ.find_by_id(weight.organ_id)
      final << weight if filter_organs.include?(organ)
    end
    final
  end

  private
    # Private: ensures parent_id is nil or valid
    def valid_or_nil_parent
      errors[:parent_id] << 'Invalid Parent ID provided' unless parent_id.nil? ||
          Animal.exists?(id: parent_id.to_i)
    end
end
