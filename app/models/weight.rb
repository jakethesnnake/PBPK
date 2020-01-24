class Weight < ApplicationRecord
  belongs_to :organ
  belongs_to :animal
  belongs_to :parameter

  validates :parameter_id, presence: true, inclusion: { in: 1..5 }, allow_blank: true
  validates :reference_string, presence: true, allow_blank: true
  validates :mean, numericality: true, allow_blank: true
  validates :standard_deviation, numericality: true, allow_blank: true
  validates :sample_size, numericality: true, allow_blank: true
  validates :number_of_studies, numericality: true, allow_blank: true

  before_validation :set_defaults

  # Public: returns integer list of reference numbers
  #
  # returns [] if none exist
  def reference_number_list
    Weight.reference_list_to_int_array(reference_string)
  end

  # Public: returns all citation objects for a given weight
  #
  # returns [] if none exist
  def citations
    nums = reference_number_list
    arr = []
    return table.collective_citations unless nums && nums.count > 0
    nums.each do |num|
      c = table.citation_by_ref_num(num)
      arr << c
    end
    arr
  end

  # Public: returns an integer list from a string of integers,
  # separated by dashes and commas
  #
  # raises error if illegal input
  def self.reference_list_to_int_array(list)
    nums = []
    return nums unless list
    parts = list.split(",")
    parts.each do |part|
      ranges = part.split("-")
      if ranges.size > 1
        i = ranges[0].try(:to_i)
        j = ranges[1].try(:to_i)
        raise 'illegal reference list format (non-int)' unless i && j
        (i..j).each { |val| nums << val }
      else
        nums << part.to_i
      end
    end
    nums
  end

  def table
    t = Table.find_by(parameter_id: parameter_id, animal_id: animal.id)
    t ||= Table.find_by(parameter_id: parameter_id, animal2_id: animal.id)
    t
  end

  def organ_name
    Organ.find_by_id(organ_id).name
  end

  def animal_name
    Animal.find_by_id(animal_id).name
  end

  private
    # Private: sets default values
    def set_defaults
      self.parameter_id ||= 1
    end
end
