class HomeController < ApplicationController
  before_action :set_home

  def index
  end

  def filter
  end

  def set_animal
    redirect_to(home_filter_path(animal_id: @animal.id))
  end

  # NOT FINISHED
  def empty
    @organs = []
  end
  
  private
    # Private: assigns animal to default value (Animal.first)
    # OR id specified by parameter value
    def set_home
      @animal = Animal.find_by_id(params[:animal_id].to_i) if params[:animal_id]
      @animal ||= Animal.first
      if params[:organ_ids]
        @organs = Organ.organs_and_children_from_id_list(params[:organ_ids])
      else
        @organs = @animal.organs
      end
      @parameter = Parameter.first
    end
end
