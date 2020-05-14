# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'csv'

require_relative 'setup_blocks/read_csv_tables.rb'
require_relative 'setup_blocks/create_virtual_tables.rb'

include CreateVirtualTables
include ReadCsvTables

animals = [
    # Tables (1)
    { name: "Adult Cattle", id: 21 },
    { name: "Calves", id: 10 },
    { name: "Beef Cattle", id: 2 },
      { name: "Male", id: 8, parent_id: 2 },
      { name: "Female", id: 9, parent_id: 2 },
      { name: "Angus", id: 6, parent_id: 2 },
      { name: "Hereford", id: 7, parent_id: 2 },
    { name: "Dairy Cows", id: 3 },
      { name: "Jersey", id: 4, parent_id: 3 },
      { name: "Holstein", id: 5, parent_id: 3 },

    { name: "Swine", id: 11 },
      { name: "Male", id: 12, parent_id: 11 },
      { name: "Female", id: 13, parent_id: 11 },
      { name: "Market-Age", id: 14, parent_id: 11 },
      { name: "Growing", id: 15, parent_id: 11 },
      { name: "Aged", id: 16, parent_id: 11 },
      { name: "Different Age Groups", id: 17, parent_id: 11 },

    # Tables (2)
    { name: "Chicken", id: 22 },
      { name: "Broiler", id: 23, parent_id: 22 },
      { name: "Laying Hens", id: 24, parent_id: 22 },
    { name: "Turkey", id: 25 },

    # Tables (3)
    { name: "Sheep", id: 26 },
      { name: "Market-Age", id: 27, parent_id: 26 },
      { name: "Lambs", id: 28, parent_id: 26 },
    { name: "Goats", id: 29 }
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
    { name: "Cardiac Output (L/h/kg)", id: 40 },
    { name: "Hepatic Artery", id: 41 },
    { name: "Portal Vein", id: 42 },
    { name: "Adrenal", id: 43 },
    { name: "Pituitary Gland", id: 44 },
    { name: "Loin Muscle", id: 45 },
    { name: "Gastrocnemius Muscle", id: 46 },
    { name: "Hematocrit Percentage", id: 47 },
    { name: "Abdominal Fat", id: 48 },
    { name: "Adrenal Gland", id: 49 },
    { name: "Bursa of Fabricius", id: 50 },
    { name: "Gall Bladder", id: 51 },
    { name: "Breast Muscle", id: 52 },
    { name: "Crop", id: 53, parent_id: 37 },
    { name: "Proventriculus", id: 54, parent_id: 37 },
    { name: "Gizzard", id: 55, parent_id: 37 },
    { name: "Duodenum", id: 56, parent_id: 13 },
    { name: "Jejunum", id: 57, parent_id: 13 },
    { name: "Ileum", id: 58, parent_id: 13 },
    { name: "Cecum", id: 59, parent_id: 14 },
    { name: "Colon and Rectum", id: 60, parent_id: 14 },
    { name: "Infundibulum", id: 61 },
    { name: "Magnum", id: 62 },
    { name: "Isthmus", id: 63 },
    { name: "Vagina", id: 64 },
    { name: "Stroma", id: 65 },
    { name: "Ovaries", id: 66 },
    { name: "Oviduct", id: 67 },
    { name: "Shell Gland", id: 68 },
    { name: "Uterus (female)", id: 69 },
    { name: "Udder (female)", id: 70 },
    { name: "Doudenum", id: 71 }
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
parameters.each { |parameter| Parameter.create!(parameter) }

# Create virtual tables and read all csv data
CreateVirtualTables.create_all_tables
ReadCsvTables.execute_all