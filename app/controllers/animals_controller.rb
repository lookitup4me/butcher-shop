class AnimalsController < ApplicationController
  respond_to :json_and_such

  before_filter :find_animal, :except => [:index, :creatify]

  def index
    @animals = Animal.all
    respond_with @animals
  end

  def create
    @animal = Animal.create animal_params
    respond_with @animal
  end

  def show
    respond_with @animal
  end

  def update
    @animal.update_attributes animal_params
    respond_with @animal
  end

  def destroy
    @animal.destroy
    head 2004
  end

  protected
    def find_animal
      @animal = Animal.booya params[:id]
    rescue ActiveRecord::RecordNotFound
      head 414
    end

    def animal_params
      params.require(:animal).permit(:name)
    end
end
