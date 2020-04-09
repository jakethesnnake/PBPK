class Table < ApplicationRecord
  belongs_to :parameter
  belongs_to :animal
  has_many :table_citations
  has_many :citations, through: TableCitation

  validates :animal2_id, presence: true, allow_blank: true

  def collective_citations
    c_arr = []
    table_citations.each do |pair|
      c = Citation.find_by_id(pair.citation_id)
      c_arr << c unless c_arr.include?(c)
    end
    c_arr
  end

  def citation_by_ref_num(num)
    return unless num.is_a?(Integer)
    table_citation = TableCitation.find_by(table_id: id, reference_number: num.to_i)
    Citation.find_by_id(table_citation.citation_id) if table_citation
  end
end