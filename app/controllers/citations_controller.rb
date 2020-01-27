class CitationsController < ApplicationController
  before_action :set_weight

  def show
    @citations = @weight.citations.sort_by { |weight| weight.author_name }
    raise 'no citations' unless @citations && @citations.count > 0
  end

  def set_weight
    @weight = Weight.find_by_id(params[:weight_id])
    @table = @weight.table
    raise Exception unless @weight
    raise Exception unless @table
  end
end
