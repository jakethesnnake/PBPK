class ReferencesController < ApplicationController
  before_action :set_weight

  # params: { id }
  def show
    @publications = @weight.publications
  end

  def full_individual
  end

  private

  def set_weight
    @weight = Weight.find_by_id(params[:id])
    return redirect_to(root_url) unless @weight
  end
end
