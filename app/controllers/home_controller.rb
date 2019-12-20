class HomeController < ApplicationController
  before_action :set_defaults
  before_action :set_filter, only: [:filter]

  def index
  end

  def filter
  end

  def set_parameter
    @parameter = Parameter.find_by_id(params[:parameter_id])
    return redirect_to(root_url) unless @parameter.is_a?(Parameter)
    @animal = Animal.find_by_id(params[:animal_id])
    if @animal
      raise 'not implemented' if @parameter.id == 5
      @parameters = @animal.parameters
      @organs = @animal.organs_for_parameter(@parameter)
    else
      @animals = @parameter.animal_list
      @organs = nil
    end
    #redirect_to(hemat_data_path(@animal)) if @parameter.id == 5
    redirect_to(root_url) unless @parameters && @animals
  end

  def set_animal
    @animal = Animal.find_by_id(params[:animal_id])

    return redirect_to(root_url) unless @animal

    @parameters = @animal.parameters
    @parameter = Parameter.find_by_id(params[:parameter_id]) || @parameters.first
    @organs = @animal.organs_for_parameter(@parameter)
  end

  def empty
    @animal = Animal.find_by_id(params[:animal_id])
    @parameter = Parameter.find_by_id(params[:parameter_id])
    return redirect_to(root_url) unless @animal && @parameter
    @organs = []
  end
  
  private

    def set_defaults
      @animals = Animal.sorted
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
