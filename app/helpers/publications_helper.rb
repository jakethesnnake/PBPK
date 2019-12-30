module PublicationsHelper
  def mini_citation_hyperlink(publication)
    return unless publication.is_a?(Publication)
    link_to(publication.mini_citation, full_individual_path(id: publication.id))
  end
end
