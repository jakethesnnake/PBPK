module AnimalHelper
  def reference_links_from_weight(weight)
    # return nil if weight
    return unless weight.is_a?(Weight)
    nums = weight.get_reference_link_list
    return [] unless nums.count > 0
    ls = []
    nums.each do |num|
      ls << publication_link(num.to_i)
    end
    ls
  end

  def publication_link(reference_number)
    return unless reference_number.is_a?(Integer) || reference_number.try(:to_i).is_a?(Integer)
    publication = Publication.find_by_reference_number(reference_number)
    link_to("#{reference_number}", publication_path(publication.id))
  end
end
