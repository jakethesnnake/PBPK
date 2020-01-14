class ReferencesController < ApplicationController
  before_action :set_weight

  # params: { id }
  def show
  end

  private

  def set_weight
    @weight = Weight.find_by_id(params[:id])
    return redirect_to(root_url) unless @weight
  end
end
