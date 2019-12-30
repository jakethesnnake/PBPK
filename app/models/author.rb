class Author < ApplicationRecord
  validates :name, presence: true

  # <NOT IMPLEMENTED>
  def add_publication
    raise Exception
  end

  def publications
    sets = AuthorPublication.where(author_id: id)
    pubs = []
    return [] unless sets.count > 0
    sets.each { |set| pubs << Publication.find_by_id(set.publication_id) }
    pubs
  end
end