class AuthorPublication < ApplicationRecord
  belongs_to :author
  belongs_to :publication

  validate :validate_author, :validate_publication

  def validate_author
    errors[:author_id] << 'Invalid Author ID' unless Author.find_by_id(author_id)
  end

  def validate_publication
    errors[:publication_id] << 'Invalid Publication ID' unless Publication.find_by_id(publication_id)
  end
end
