class CitationsController < ApplicationController
  before_action :set_weight

  def show
    @citations = @weight.citations.sort_by { |weight| weight.author_name }
    raise 'no citations' unless @citations
  end

  def set_weight
    @weight = Weight.find_by_id(params[:weight_id]) || Hemat.find_by_id(params[:hemat_id])
    @table = @weight.table
    raise Exception unless @weight && @table
    raise 'not implemented hemat' if @weight.is_a?(Hemat)
  end
end
