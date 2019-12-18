class AnimalController < ApplicationController
  before_action :set_animal, only: [:show]

  def index
    @animals = Animal.all
  end

  def filter
    @animal = Animal.find_by_id(params[:animal_id])
    redirect_to(@animal)
  end

  def show
  end

  private
    def set_animal
      @animal = Animal.find_by_id(params[:id])
    end
end