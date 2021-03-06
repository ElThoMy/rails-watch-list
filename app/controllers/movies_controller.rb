class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :destroy]

  def index
    @movies = Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(review_params)
    @movie.save
    redirect_to lists_path
  end

  def edit
  end

  def update
    @movie = @movie.update(review_params)
    @movie.save
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private
  def find_movie
    @movie = Movie.find(params[:id])
  end

  def review_params
    params.require(:movie).permit([:title, :overview, :rating])
  end
end
