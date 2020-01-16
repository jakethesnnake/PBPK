class Citation < ApplicationRecord
  validates :all_text, presence: true
  before_create :set_defaults

  # Public: returns year from all of text
  #
  # returns integer value
  def self.parse_year(text)
    return unless text.is_a?(String)
    year = (text.split(')').first).split('(').second
    trim_year(year).try(:to_i)
  end

  # Public: trims year to integer if letter included
  #
  # returns trimmed year
  def self.trim_year(year)
    return unless year.is_a?(String) && year.size >= 4
    year[0..3]
  end

  # Public: returns author name from full text
  #
  # returns nil unless text is string
  def self.parse_author_name(text)
    return unless text.is_a?(String)
    text.split(',').first
  end

  def author_name
    Author.find_by_id(author_id).name
  end

  # Private: sets default values before create
  def set_defaults
    self.year ||= Citation.parse_year(all_text)
    self.author_id ||= Author.find_or_create_by!(name: Citation.parse_author_name(all_text)).id
  end
end
