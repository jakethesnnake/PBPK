module ReadCsvTables
  def read_all
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
end