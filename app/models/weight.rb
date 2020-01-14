class Weight < ApplicationRecord
  belongs_to :organ
  belongs_to :animal

  validates :parameter_id, presence: true, inclusion: { in: 1..5 }, allow_blank: true
  validates :reference_string, presence: true, allow_blank: true
  validates :mean, numericality: true, allow_blank: true
  validates :standard_deviation, numericality: true, allow_blank: true
  validates :sample_size, numericality: true, allow_blank: true
  validates :number_of_studies, numericality: true, allow_blank: true

  before_validation :set_defaults

  # after_create :add_list

  # Public: creates associations from reference string values
  #
  # does nothing unless string is present
  def add_list
    raise Exception
  end

  def table
    Table.find_by(parameter_id: parameter_id, animal_id: animal.id)
  end

  def organ_name
    Organ.find_by_id(organ_id).name
  end

  def animal_name
    Animal.find_by_id(animal_id).name
  end

  # Public (setup): uses reference list to create associations between the weight and its associated publication(s)
  #
  # num_list - list of integers, referencing a publication
  #
  # raises Exception if parameter empty or invalid reference number
  def add_reference_number_list(list)
    raise Exception
  end

  def add_reference(reference)
    raise Exception
  end

  private
    # Private: sets default values
    def set_defaults
      self.parameter_id ||= 1
    end
end
