class HomeController < ApplicationController
  before_action :assign_variables, only: [:index, :filter]

  def index
  end

  def filter
  end

  def set_animal
    raise Exception
  end

  # NOT FINISHED
  def empty
    @animals = []
    @organs = []
    @parameters = []
  end
  
  private
    def assign_variables(animal_ids = params[:animal_ids], organ_ids = params[:organ_ids], parameter_ids = params[:parameter_ids])
      @animals = [] ; @organs = [] ; @parameters = []
      animal_ids ? animal_ids.each { |id| @animals << Animal.find_by_id(id.to_i) } : @animals = Animal.all
      organ_ids ? organ_ids.each { |id| @organs << Organ.find_by_id(id.to_i) } : @organs = Organ.all
      parameter_ids ? parameter_ids.each { |id| @parameters << Parameter.find_by_id(id.to_i) } : @parameters = Parameter.all
      @animal = Animal.first # <TEMPORARY>
      add_organ_children
    end

    def add_organ_children
      return unless @organs.count > 0
      @organs = Organ.organs_and_all_children(@organs)
    end
end
