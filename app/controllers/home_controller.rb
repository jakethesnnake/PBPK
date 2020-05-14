class HomeController < ApplicationController
  before_action :set_defaults
  before_action :set_filter, only: [:filter]

  def index
  end

  def filter
  end

  def set_parameter
    @parameter = Parameter.find_by_id(params[:parameter_id])
    @animal = Animal.find_by_id(params[:animal_id])

    return redirect_to(root_url) unless @parameter

    if @animal
      @parameters = [@parameter]
      @organs = @animal.organs_for_parameter(@parameter)
    else
      @parameters = Parameter.all
      @organs = []
    end

    redirect_to(root_url) unless @parameters && @animals
  end

  def set_animal
    @animal = Animal.find_by_id(params[:animal_id])
    @parameter = Parameter.find_by_id(params[:parameter_id])

    return redirect_to(root_url) unless @animal

    if @parameter
      @parameters = [@parameter]
      @organs = @animal.organs_for_parameter(@parameter)
    else
      @parameters = @animal.parameters
      @organs = []
    end
  end

  def empty
    @animal = Animal.find_by_id(params[:animal_id])
    @parameter = Parameter.find_by_id(params[:parameter_id])

    return redirect_to(root_url) unless @animal && @parameter

    @organs = []
  end
  
  private

    def set_defaults
      @animals = Animal.ordered
      @parameters = Parameter.all
    end

    # Precondition: animal || parameter is provided
    def set_filter
      @animal = Animal.find_by_id(params[:animal_id])
      @parameter = Parameter.find_by_id(params[:parameter_id])
      @parameters = @animal.try(:parameters)
      return redirect_to(root_url) unless @animal && @parameter
      # HANDLE CASE WHERE PARAM.ID == 5
      if params[:organ_ids]
        @organs = Organ.organs_and_children_from_id_list(params[:organ_ids])
      else
        @organs = @animal.organs_for_parameter(@parameter)
      end
    end
end
