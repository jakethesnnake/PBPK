module ReadTables
  def read_full_citation_list
    CSV.read("lib/csv-tables/full-citation-list.csv", :headers => true).each { |row| Citation.create!(row.to_h) }
  end

  def read_all
    CSV.read("lib/csv-tables/table1.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("lib/csv-tables/table2-with-ids.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("lib/csv-tables/table3-with-ids.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("lib/csv-tables/table4-with-ids.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("lib/csv-tables/table5-with-ids.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("lib/csv-tables/table6-with-ids.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("lib/csv-tables/table7-with-ids.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("lib/csv-tables/table9-with-ids.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("lib/csv-tables/table10-with-ids.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("lib/csv-tables/table11-with-ids.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("lib/csv-tables/table12-with-ids.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("lib/csv-tables/table13-to-17-with-ids.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("lib/csv-tables/table19-with-ids.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("lib/csv-tables/table21-with-ids.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("lib/csv-tables/table23-with-ids.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("lib/csv-tables/table24-with-ids.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("lib/csv-tables/table28-with-ids.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("lib/csv-tables/table29-with-ids.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("lib/csv-tables/table30-with-ids.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("lib/csv-tables/table32-with-ids.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("lib/csv-tables/table33-with-ids.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
    CSV.read("lib/csv-tables/table34-to-37-hematocrit.csv", :headers => true).each { |row| Hemat.create!(row.to_h) }
  end

  def create_table_associations
    [
      { id: 1, animal_id: 1, parameter_id: 1 },
      { id: 2, animal_id: 2, parameter_id: 1 },
      { id: 3, animal_id: 3, parameter_id: 1 },
      { id: 4, animal_id: 4, parameter_id: 1, animal2_id: 5 },
      { id: 5, animal_id: 6, parameter_id: 1, animal2_id: 7 },
      { id: 6, animal_id: 8, parameter_id: 1, animal2_id: 9 },
      { id: 7, animal_id: 10, parameter_id: 1 },
      { id: 9, animal_id: 11, parameter_id: 1 },
      { id: 10, animal_id: 12, parameter_id: 1 },
      { id: 11, animal_id: 13, parameter_id: 1 },
      { id: 12, animal_id: 14, parameter_id: 1 },
      { id: 13, animal_id: 21, parameter_id: 2 },
      { id: 16, animal_id: 10, parameter_id: 2 },
      { id: 17, animal_id: 11, parameter_id: 2 },
      { id: 18, animal_id: 3, parameter_id: 2 },
      { id: 19, animal_id: 21, parameter_id: 3 },
      { id: 21, animal_id: 2, parameter_id: 3 },
      { id: 23, animal_id: 3, parameter_id: 3 },
      { id: 24, animal_id: 10, parameter_id: 3 },
      { id: 28, animal_id: 11, parameter_id: 3 },
      { id: 29, animal_id: 21, parameter_id: 4 },
      { id: 30, animal_id: 10, parameter_id: 4 },
      { id: 32, animal_id: 13, parameter_id: 4 },
      { id: 33, animal_id: 16, parameter_id: 4 },
      { id: 34, animal_id: 21, parameter_id: 5 },
      { id: 35, animal_id: 10, parameter_id: 5 },
      { id: 36, animal_id: 11, parameter_id: 5 },
      { id: 37, animal_id: 17, parameter_id: 5 }
    ].each { |table| Table.create!(table) }
  end
end