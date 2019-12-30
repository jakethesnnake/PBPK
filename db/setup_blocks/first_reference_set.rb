module FirstReferenceSet
  def exe
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
  end
end