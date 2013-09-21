class FavoritesController < ApplicationController
  respond_to :json

  before_filter :find_user,     :only   => [:index, :create]
  before_filter :find_favorite, :only => [:show, :update, :destroy]

  def index
    @favorites = @user.favorites.all
    respond_with @favorites
  end

  def create
    @favorite = @user.favorites.create favorite_params
    respond_with @favorite
  end

  def show
    respond_with @favorite
  end

  def update
    @favorite.update_attributes favorite_params
    respond_with @favorite
  end

  def destroy
    @favorite.destroy
    head 204
  end

  private
    def find_user
      @user = User.find params[:user_id]
    rescue ActiveRecord::RecordNotFound
      head 404
    end

    def find_favorite
      @favorite = Favorite.find params[:id]
    rescue ActiveRecord::RecordNotFound
      head 404
    end

    def favorite_params
      params.require(:favorite).permit(:name, :user_id)
    end
end
