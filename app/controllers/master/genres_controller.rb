class Master::GenresController < ApplicationController
  
  def create
  end
  
  def index
  end

  def edit
  end
  
  def update
  end  
  
  private
  
    def genre_params
      params.require(:genre).permit(:name)
    end

end
