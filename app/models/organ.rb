class Organ < ApplicationRecord
  validates :name, presence: true
  validate :has_valid_or_nil_parent

  # Public: returns parent organ
  def parent
    Organ.find_by_id(parent_id.to_i)
  end

  # Public: returns all children and grandchildren (etc.) for a given organ
  def self.children(id)
    c_arr = Organ.where(parent_id: id)
    return [] unless c_arr
    c_arr.each { |child| c_arr = c_arr | Organ.children(child.id) }
    c_arr
  end

  # Public: returns the list of organs along with its children
  def self.organs_and_all_children(organs)
    return [] unless organs && organs.try(:count) > 0
    o_arr = []
    organs.each { |organ| o_arr = o_arr | Organ.children(organ.id) }
    o_arr | organs
  end

  # Public: returns true if organ has parent
  def is_child?
    parent_id.present?
  end

  # Public: returns true if organ has parent && grandparent
  def is_grandchild?
    return false unless parent
    parent.is_child?
  end

  private
    def has_valid_or_nil_parent
      errors[:parent_id] << 'Invalid Parent ID provided' unless parent_id.nil? ||
          Organ.exists?(id: parent_id.to_i)
    end
end
