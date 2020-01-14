module ReferencesHelper
  def reference_link(reference)
    return unless reference.is_a?(Reference)
    raise Exception
    # link_to(publication.mini_citation, full_individual_path(id: publication.id))
  end
end
