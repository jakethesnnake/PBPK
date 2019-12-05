class Publication < ApplicationRecord
  validates :year, numericality: true, :inclusion => 1800..Date.today.year

  def authors
    sets = AuthorPublication.where(publication_id: id)
    auth_arr = []
    return [] unless sets.count > 0
    sets.each { |set| auth_arr << Author.find_by_id(set.author_id) }
    auth_arr
  end

  # <TEST>
  def self.insert_reference!(reference)
    raise Exception unless reference[:name] && reference[:id] && reference[:year]
    author = Author.find_or_create_by!(name: reference[:name])
    publication = Publication.create!(year: reference[:year], reference_number: reference[:id])
    AuthorPublication.create!(author_id: author.id, publication_id: publication.id)
    if reference[:name2]
      author2 = Author.find_or_create_by!(name: reference[:name2])
      AuthorPublication.create!(author_id: author2.id, publication_id: publication.id)
    end
  end
end