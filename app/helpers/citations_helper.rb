module CitationsHelper
  # Public: returns citation link for weight
  def citation_link(weight)
    link_to("See References", show_citations_path(weight_id: weight.id), class: "btn-info") if weight.is_a?(Weight)
  end
end
