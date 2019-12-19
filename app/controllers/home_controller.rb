class HomeController < ApplicationController
  before_action :set_defaults
  before_action :set_filter, only: [:filter, :empty]

  def index
  end

  def filter
  end

  # <TEST>
  def set_parameter
    @parameter = Parameter.find_by_id(params[:parameter_id])
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
    raise Exception unless @parameter && @parameters && @animals
  end

  # <CHECK IF PARAMETER IS ALREADY SET!!>
  def set_animal
    @animal = Animal.find_by_id(params[:animal_id])
    @parameter = Parameter.find_by_id(params[:parameter_id])
    
    return redirect_to(root_url) unless @animal

    @parameters = @animal.parameters
    @parameter ||= @parameters.first
    @organs = @animal.organs_for_parameter(@parameter)
  end

  def empty
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
