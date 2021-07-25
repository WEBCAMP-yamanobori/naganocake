class Admin::GenresController < ApplicationController
  
  skip_before_action :authenticate_customer!, only: [:index, :create, :edit, :update]
  before_action :if_not_admin
  
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_back(fallback_location: root_path)
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  private
  
  def if_not_admin
    redirect_to root_path unless admin_signed_in?
  end
  
  def genre_params
    params.require(:genre).permit(:name)
  end
end
