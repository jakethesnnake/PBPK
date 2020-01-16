module CitationsHelper
  # Public: returns citation link for weight OR hemat
  def citation_link(weight)
    return unless weight.is_a?(Weight) || weight.is_a?(Hemat)
    if weight.is_a?(Weight)
      link_to("See References", show_citations_path(weight_id: weight.id), class: "btn-info")
    else
      link_to("See References", show_citations_path(hemat_id: weight.id), class: "btn-info")
    end
  end
end
