# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.html.haml by default
  end

  def new
    @movie = Movie.new
    # default: render 'new' template
  end 
  def create
    params.require(:movie)
    permitted = params[:movie].permit(:title,:rating,:release_date)
    # shortcut: permitted = params.require(:movie).permit(:title,:rating,:release_date)
    # rest of code...
    # using permitted instead of params[:movie]
    @movie = Movie.create!(permitted)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end
  
  
  
end

