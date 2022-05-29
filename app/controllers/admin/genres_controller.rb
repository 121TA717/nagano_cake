class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
  end


  def create
    @genre = Genre.new(genre_params)
  end

  def edit
    @genre = Genre.find(params[:id])
  end


  def update
    
  end

end
