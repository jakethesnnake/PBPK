class PublicationsController < ApplicationController
  def show
    @publication = Publication.find_by_id(params[:id])
  end
end
