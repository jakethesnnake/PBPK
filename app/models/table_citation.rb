class TableCitation < ApplicationRecord
  belongs_to :table
  belongs_to :citation
  validates :reference_number, presence: true, allow_blank: true
  validates :volume, presence: true, allow_blank: true

  # Public: adds citation to table
  #
  # <volume number not implemented>
  def self.add!(row)
    table = Table.find_by_id(row["table_id"])
    name = row["author_name"]
    year = row["year"]
    author = Author.find_by_name(name)

    raise "author error: author_name=#{name} and year=#{year}" unless author
    raise "year error: author_name=#{name} and year=#{year}" unless year
    raise "table error: row=#{row.to_s}" unless table

    citation = Citation.find_by(author_id: author.id, year: year)

    raise "citation error: #{author.name} (#{year})" unless citation

    TableCitation.create!(table_id: table.id, citation_id: citation.id,
                          reference_number: row["reference_number"],
                          volume: row["volume"])
  end
end
