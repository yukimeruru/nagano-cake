class Master::GenresController < ApplicationController

  def create
    genre = Genre.new(genre_params)
    if genre.save
      redirect_to master_genres_path
    else
      flash.now[:alert] = "データが正常に保存されませんでした"
      render 'index'
    end
  end

  def index
    @genre = Genre.new
    @genres  = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to master_genres_path
  end

  private

    def genre_params
      params.require(:genre).permit(:name)
    end

end
