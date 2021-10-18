class Master::ItemsController < ApplicationController
  
  def new
  end
   
  def create
  end
  
  def index
  end

  def show
  end
  
  def edit
  end
  
  def update
  end
  
  private
  
    def item_params
      params.require(:item).permit(:name, :description, :image, :price, :sales_status)
    end

end
