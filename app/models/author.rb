class Author < ApplicationRecord
  validates :name, presence: true

  def references
    raise Exception
  end
end