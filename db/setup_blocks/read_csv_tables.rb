module ReadCsvTables
  def execute_all
    read_all_citations
    read_all_weight_data
    read_all_references
    read_table_only_citations
  end

  def read_all_citations
    CSV.read("db/csv-tables/1/full-citation-list.csv", :headers => true).each { |row| Citation.create!(row.to_h) }
    CSV.read("db/csv-tables/2/full-citation-list.csv", :headers => true).each { |row| Citation.create!(row.to_h) }
    CSV.read("db/csv-tables/3/full-citation-list.csv", :headers => true).each { |row| Citation.create!(row.to_h) }
  end

  def read_all_weight_data
    # (1) Cattle/Swine
    CSV.read("db/csv-tables/1/table1.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/1/table2.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/1/table3.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/1/table4.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/1/table5.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/1/table6.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/1/table7.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/1/table9.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/1/table10.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/1/table11.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/1/table12.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/1/table13-to-17.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/1/table19.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/1/table21.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/1/table23.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/1/table24.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/1/table28.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/1/table29.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/1/table30.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/1/table32.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/1/table33.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/1/table34-to-37.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    # (2) Chicken/Turkey
    CSV.read("db/csv-tables/2/table1.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/2/table2.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/2/table3.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/2/table10.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/2/table15.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/2/table17.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/2/table19-20.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    # (3) Sheep/Goat
    CSV.read("db/csv-tables/3/table4.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/3/table5.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/3/table8.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/3/table9-10.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/3/table11.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/3/table15.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/3/table16.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("db/csv-tables/3/table18-21.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
  end

  def read_all_references
    CSV.read("db/csv-tables/1/citations/table1.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table2.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table3.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table4.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table5.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table6.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table7.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table9.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table10.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table11.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table12.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table13.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table16.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table17.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table19.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table21.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table23.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table24.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table28.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table29-33.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table34.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table35.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table36.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table37.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/2/citations/table38.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/2/citations/table39.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/2/citations/table40.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/2/citations/table41-42.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/2/citations/table43-44.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/2/citations/table45-46.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/3/citations/table4.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/3/citations/table5.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/3/citations/table8.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/3/citations/table11.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
  end

  def read_table_only_citations
    CSV.read("db/csv-tables/1/citations/table_only/table4.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table_only/table5.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table_only/table13-17.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table_only/table29-33.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/1/citations/table_only/table34-37.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/3/citations/table_only/table9.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/3/citations/table_only/table10.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/3/citations/table_only/table15-16.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
    CSV.read("db/csv-tables/3/citations/table_only/table18-21.csv", :headers => true).each { |row| TableCitation.add!(row.to_h) }
  end
end