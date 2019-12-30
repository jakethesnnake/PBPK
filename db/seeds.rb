# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'csv'

require_relative 'setup_blocks/first_reference_set.rb'
require_relative 'setup_blocks/read_csv_tables.rb'

include FirstReferenceSet
include ReadCsvTables

animals = [
    { name: "Cattle", id: 1 },
    { name: "Beef Cattle", id: 2, parent_id: 1 },
    { name: "Dairy Cows", id: 3, parent_id: 1 },
    { name: "Jersey", id: 4, parent_id: 3 },
    { name: "Holstein", id: 5, parent_id: 3 },
    { name: "Angus", id: 6, parent_id: 2 },
    { name: "Hereford", id: 7, parent_id: 2 },
    { name: "Male Beef Cattle", id: 8, parent_id: 2 },
    { name: "Female Beef Cattle", id: 9, parent_id: 2 },
    { name: "Calves", id: 10, parent_id: 1 },
    { name: "Swine", id: 11 },
    { name: "Male Swine", id: 12, parent_id: 11 },
    { name: "Female Swine", id: 13, parent_id: 11 },
    { name: "Market-Age Swine", id: 14, parent_id: 11 },
    { name: "Growing Swine", id: 15, parent_id: 11 },
    { name: "Aged Swine", id: 16, parent_id: 11 },
    { name: "Different Age Groups of Swine", id: 17, parent_id: 11 },
    { name: "Adult Cattle", id: 21, parent_id: 1 }
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
    { name: "Corpora Lutea", id: 35 },
    { name: "Body Weight (kg)", id: 36 },
    { name: "Stomachs", id: 37, parent_id: 6 },
    { name: "Stomach", id: 38, parent_id: 6 },
    { name: "Skin", id: 39 },
    { name: "Cardiac Output (L/h/kg Body Weight)", id: 40 },
    { name: "Hepatic Artery", id: 41 },
    { name: "Portal Vein", id: 42 },
    { name: "Adrenal", id: 43 },
    { name: "Pituitary Gland", id: 44 },
    { name: "Loin Muscle", id: 45 },
    { name: "Gastrocnemius Muscle", id: 46 },
    { name: "Hematocrit (%)", id: 47 }
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
    {name: "Cardiac Output", id: 2},
    {name: "Blood Flow", id: 3},
    {name: "Vascular Space Fraction", id: 4},
    {name: "Hematocrit", id: 5}
]

animals.each { |animal| Animal.create!(animal) }
organs.each { |organ| Organ.create!(organ) }
weights.each { |weight| Weight.create!(weight) }
references.each { |reference| Publication.insert_reference!(reference) }
parameters.each { |parameter| Parameter.create!(parameter) }

FirstReferenceSet.insert_first_set
ReadCsvTables.read_all