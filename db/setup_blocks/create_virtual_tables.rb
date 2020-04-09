module CreateVirtualTables
  def create_all_tables
    [
        { id: 1, animal_id: 21, parameter_id: 1 },
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
        { id: 37, animal_id: 17, parameter_id: 5 },

        ## TURKEY/CHICKEN

        ## tables 1-3 (p1)
        { id: 38, animal_id: 23, parameter_id: 1 }, # 1 => 38
        { id: 39, animal_id: 24, parameter_id: 1 },
        { id: 40, animal_id: 25, parameter_id: 1 },

        ## tables 10-11 (p2)
        { id: 41, animal_id: 22, parameter_id: 2 },
        { id: 42, animal_id: 25, parameter_id: 2 },

        ## tables 15,17 (p3)
        { id: 43, animal_id: 23, parameter_id: 3 },
        { id: 44, animal_id: 24, parameter_id: 3 },

        ## tables 19-20 (p5)
        { id: 45, animal_id: 22, parameter_id: 5 },
        { id: 46, animal_id: 25, parameter_id: 5 }

    ].each { |table| Table.create!(table) }
  end
end