class Author < ApplicationRecord
  validates :name, presence: true

  def citations
    Citation.where(author_id: id)
  end
end