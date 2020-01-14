class TableCitation < ApplicationRecord
  belongs_to :table
  belongs_to :citation
  validates :reference_number, presence: true, allow_blank: true
  validates :volume, presence: true, allow_blank: true

  def self.add!(row)
    table = Table.find_by_id(row["table_id"])
    author = Author.find_by_name(row["author_name"])
    year = row["year"]

    raise 'author or year error' unless author && year
    raise 'table error' unless table

    citation = Citation.find_by(author_id: author.id, year: year)

    raise 'citation error' unless citation

    TableCitation.create!(table_id: table.id, citation_id: citation.id, reference_number: row["reference_number"], volume: row["volume"])
  end
end
