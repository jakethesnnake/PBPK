# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'csv'

animals = [
    { name: "Cattle", id: 1 },
    { name: "Beef Cattle", id: 2, parent_id: 1 },
    { name: "Dairy Cows", id: 3, parent_id: 1 }
]
organs = [
    { name: "Adrenals", id: 1 },
    { name: "Adipose Tissue", id: 2 },
    { name: "Blood", id: 3 },
    { name: "Bone", id: 4 },
    { name: "Brain", id: 5 },

    { name: "GI Tract", id: 6 },
    { name: "Reticulorumen", id: 7, parent_id: 6 },
    { name: "Reticulum", id: 8, parent_id: 7 },
    { name: "Rumen", id: 9, parent_id: 7 },
    { name: "Omasum", id: 10, parent_id: 6 },
    { name: "Abomasum", id: 11, parent_id: 6 },

    { name: "Intestines", id: 12 },
    { name: "Small Intestine", id: 13, parent_id: 12 },
    { name: "Large Intestine", id: 14, parent_id: 12 },
    { name: "Caecum", id: 15, parent_id: 14 },
    { name: "Colon", id: 16, parent_id: 14 },

    { name: "Heart", id: 17 },
    { name: "Kidneys", id: 18 },
    { name: "Liver", id: 19 },
    { name: "Lungs", id: 20 },
    { name: "Muscle", id: 21 },
    { name: "Pancreas", id: 22 },
    { name: "Spleen", id: 23 },
    { name: "Thyroid", id: 24 },
    { name: "Thymus", id: 25 },
    { name: "Rest of Body", id: 26 },
    { name: "Adrenal Glands", id: 27 },
    { name: "Testes", id: 28 },
    { name: "Mammary Gland", id: 29 },
    { name: "Mammary Gland (non-lactating)", id: 30, parent_id: 29 },
    { name: "Mammary Gland (lactating)", id: 31, parent_id: 29 },
    { name: "Mammary Gland (pregnancy)", id: 32, parent_id: 29 },
    { name: "Uterus", id: 33 },
    { name: "Ovary", id: 34 },
    { name: "Corpora Lutea", id: 35 }
]
weights = [
    { animal_id: 1, organ_id: 1, mean: 0.006, standard_deviation: 0.002, sample_size: 716, number_of_studies: 3, id: 1 }, # Adrenals
    { animal_id: 1, organ_id: 2, mean: 12.27, standard_deviation: 5.21, sample_size: 301, number_of_studies: 9, id: 2 }, # Adipose Tissue
    { animal_id: 1, organ_id: 3, mean: 4.31, standard_deviation: 0.87, sample_size: 893, number_of_studies: 9, id: 3 }, # Blood
    { animal_id: 1, organ_id: 4, mean: 8.66, standard_deviation: 1.49, sample_size: 40, number_of_studies: 2, id: 4 }, # Bone
    { animal_id: 1, organ_id: 5, mean: 0.08, standard_deviation: 0.01, sample_size: 812, number_of_studies: 2, id: 5 }, # Brain

    { animal_id: 1, organ_id: 6, mean: 5.98, standard_deviation: 1.28, sample_size: 107, number_of_studies: 6, id: 6 }, # GI Tract
    { animal_id: 1, organ_id: 7, mean: 1.76, standard_deviation: 0.45, sample_size: 339, number_of_studies: 7, id: 7 }, # Reticulorumen
    { animal_id: 1, organ_id: 8, mean: 0.26, standard_deviation: 0.07, sample_size: 696, number_of_studies: 1, id: 8 }, # Reticulum
    { animal_id: 1, organ_id: 9, mean: 1.75, standard_deviation: 0.35, sample_size: 869, number_of_studies: 4, id: 9 }, # Rumen
    { animal_id: 1, organ_id: 10, mean: 0.85, standard_deviation: 0.22, sample_size: 948, number_of_studies: 6, id: 10 }, # Omasum
    { animal_id: 1, organ_id: 11, mean: 0.37, standard_deviation: 0.10, sample_size: 948, number_of_studies: 6, id: 11 }, # Abomasum
    { animal_id: 1, organ_id: 12, id: 12 }, # Intestines
    { animal_id: 1, organ_id: 13, mean: 1.06, standard_deviation: 0.24, sample_size: 1158, number_of_studies: 10, id: 13 }, # Small Intestine
    { animal_id: 1, organ_id: 14, mean: 0.78, standard_deviation: 0.21, sample_size: 919, number_of_studies: 8, id: 14 }, # Large Intestine
    { animal_id: 1, organ_id: 15, mean: 0.08, standard_deviation: 0.01, sample_size: 168, number_of_studies: 3, id: 15 }, # Caecum
    { animal_id: 1, organ_id: 16, mean: 0.39, standard_deviation: 0.02, sample_size: 93, number_of_studies: 1, id: 16 }, # Colon
    { animal_id: 1, organ_id: 17, mean: 0.40, standard_deviation: 0.07, sample_size: 1828, number_of_studies: 28, id: 17 }, # Heart
    { animal_id: 1, organ_id: 18, mean: 0.21, standard_deviation: 0.04, sample_size: 2159, number_of_studies: 29, id: 18 }, # Kidneys
    { animal_id: 1, organ_id: 19, mean: 1.23, standard_deviation: 0.21, sample_size: 2256, number_of_studies: 32, id: 19 }, # Liver
    { animal_id: 1, organ_id: 20, mean: 0.77, standard_deviation: 0.20, sample_size: 1773, number_of_studies: 21, id: 20 }, # Lungs
    { animal_id: 1, organ_id: 21, mean: 36.1, standard_deviation: 11.73, sample_size: 83, number_of_studies: 2, id: 21 }, # Muscle
    { animal_id: 1, organ_id: 22, mean: 0.09, standard_deviation: 0.02, sample_size: 1319, number_of_studies: 12, id: 22 }, # Pancreas
    { animal_id: 1, organ_id: 23, mean: 0.18, standard_deviation: 0.05, sample_size: 1642, number_of_studies: 22, id: 23 }, # Spleen
    { animal_id: 1, organ_id: 24, mean: 0.006, standard_deviation: 0.002, sample_size: 696, number_of_studies: 1, id: 24 }, # Thyroid
    { animal_id: 1, organ_id: 25, mean: 0.03, standard_deviation: 0.018, sample_size: 728, number_of_studies: 3, id: 25 }, # Thymus
    { animal_id: 1, organ_id: 26, mean: 29.67, id: 26 } # Thymus
]

references = [
    { id: 1, name: "Matthews", year: 1975 },
    { id: 2, name: "Buntyn", year: 2017 },
    { id: 3, name: "Garrett", year: 1968 },
    { id: 4, name: "DiCostanzo", year: 1991 },
    { id: 5, name: "Velazco", year: 1997 },
    { id: 6, name: "Andrew", year: 1994 },
    { id: 7, name: "Robelin", year: 1981 },
    { id: 8, name: "De Paula", year: 2013 },
    { id: 9, name: "Fernades", year: 1996 },
    { id: 10, name: "Sainz", year: 1995 },
    { id: 11, name: "Keane", year: 2011 },
    { id: 12, name: "Hansard", year: 1953 },

    { id: 13, name: "Larsen", year: 2017 },
    { id: 14, name: "Rumsey", year: 1996 },
    { id: 15, name: "Long", year: 2010 },
    { id: 16, name: "Rotta", year: 2015 },
    { id: 17, name: "McCurdy", year: 2010 },
    { id: 18, name: "Hansard", year: 1956 },
    { id: 19, name: "Swett", year: 1933 },
    { id: 20, name: "Faulkner", year: 1989 },
    { id: 21, name: "Ballarin", year: 2016 },
    { id: 22, name: "Sharman", year: 2013 },
    { id: 23, name: "Sprinkle", year: 1998 },
    { id: 24, name: "Schumann", year: 2007 },

    { id: 25, name: "Reynolds", year: 2004 },
    { id: 26, name: "Remling", year: 2017 },
    { id: 27, name: "Mader", year: 2009 },
    { id: 28, name: "Fitzsimons", year: 2014 },
    { id: 29, name: "Jenkins", name2: "Ferrell", year: 1997 },
    { id: 30, name: "Wood", year: 2013 },
    { id: 31, name: "Scheaffer", year: 2001 },
    { id: 32, name: "Terry", year: 1990 },
    { id: 33, name: "Early", year: 1998 },
    { id: 34, name: "Schlegel", year: 2006 },
    { id: 35, name: "Olivares", year: 2019 },
    { id: 36, name: "McEvoy", year: 1998 },

    { id: 37, name: "Fiems", year: 1993 },
    { id: 38, name: "Long", year: 2012 },
    { id: 39, name: "Talton", year: 2014 },
    { id: 40, name: "Murphy", name2: "Loerch", year: 1994 },
    { id: 41, name: "Jenkins", name2: "Ferrell", year: 2012 },
    { id: 42, name: "Sainz", name2: "Bentley", year: 1997 },
    { id: 43, name: "Burciaga-Robles", year: 2010 },
    { id: 44, name: "Moseley", year: 1992 },
    { id: 45, name: "Lawler", year: 2004 },
    { id: 46, name: "Robertson", year: 1967 },
    { id: 47, name: "Shahin", name2: "Berg", year: 1985 },
    { id: 48, name: "Fonseca", year: 2017 }
]

parameters = [
    {name: "Organ Weight", id: 1},
    # {name: "Tissue Volume", id: 2},
    # {name: "Blood Flow", id: 3}
]

animals.each { |animal| Animal.create!(animal) }
organs.each { |organ| Organ.create!(organ) }
weights.each { |weight| Weight.create!(weight) }
references.each { |reference| Publication.insert_reference!(reference) }
parameters.each { |parameter| Parameter.create!(parameter) }

# # ADD REFERENCE NUMBERS
Weight.find_by_id(1).add_reference_number_list([1, 2, 3]) # adrenals
Weight.find_by_id(2).add_reference_number_list([4, 5, 6, 7, 8, 9, 10, 11, 48]) # adipose tissue
Weight.find_by_id(3).add_reference_number_list([1, 12, 13, 14, 15, 16, 17, 18, 19]) # blood
Weight.find_by_id(4).add_reference_number_list([11, 20]) # bone
Weight.find_by_id(5).add_reference_number_list([1, 21]) # brain
Weight.find_by_id(6).add_reference_number_list([4, 6, 14, 22, 23, 24]) # gi tract
Weight.find_by_id(7).add_reference_number_list([15, 16, 22, 25, 26, 27, 28]) # reticulorumen
Weight.find_by_id(8).add_reference_number_list([1]) # reticulum
Weight.find_by_id(9).add_reference_number_list([1, 14, 29, 30]) # rumen
Weight.find_by_id(10).add_reference_number_list([1, 15, 16, 22, 25, 27]) # omasum
Weight.find_by_id(11).add_reference_number_list([1, 15, 16, 22, 25, 27]) # abomasum
# intestines
Weight.find_by_id(13).add_reference_number_list([1, 14, 15, 16, 17, 22, 25, 27, 29, 31]) # small intestine
Weight.find_by_id(14).add_reference_number_list([1, 14, 15, 16, 17, 22, 25, 31]) # large intestine
Weight.find_by_id(15).add_reference_number_list([17, 25, 27]) # caecum
Weight.find_by_id(16).add_reference_number_list([27]) # colon
Weight.find_by_id(17).add_reference_number_list([1, 2, 3, 4, 14, 15, 16, 17, 18, 22, 24, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42]) # heart
Weight.find_by_id(18).add_reference_number_list([1, 4, 6, 14, 20, 23, 31, 32, 33, 36, 37, 40, 41, 43, 46]) # kidneys
Weight.find_by_id(19).add_reference_number_list([1, 2, 3, 4, 6, 14, 15, 16, 17, 18, 19, 20, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 36, 37, 40, 41, 43, 44, 45, 46]) # liver
Weight.find_by_id(20).add_reference_number_list([1, 2, 4, 32, 15, 16, 17, 18, 22, 24, 26, 27, 28, 29, 30, 33, 34, 37, 38, 39, 42]) # lungs
Weight.find_by_id(21).add_reference_number_list([11, 47]) # muscle
Weight.find_by_id(22).add_reference_number_list([1, 32, 15, 17, 22, 26, 24, 27, 30, 38, 39, 43]) # pancreas
Weight.find_by_id(23).add_reference_number_list([1, 3, 4, 10, 14, 15, 16, 17, 18, 22, 24, 25, 26, 27, 28, 30, 32, 33, 34, 39, 41, 45]) # spleen
Weight.find_by_id(24).add_reference_number_list([1]) # thyroid
Weight.find_by_id(25).add_reference_number_list([1, 24, 26]) # thymus

# CSV file reading
CSV.read("tmp/csv-tables/table2-with-ids.csv", :headers => true).each { |row| Weight.create!(row.to_h) }
CSV.read("tmp/csv-tables/table3-with-ids.csv", :headers => true).each { |row| Weight.create!(row.to_h) }