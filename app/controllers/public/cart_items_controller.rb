class Public::CartItemsController < ApplicationController

  def new
  end
  
  def create
  end
  
  def index
  end
  
  def show
  end
  
  def check
  end
  
  def thanks
  end
  
  private
  
    def cart_item_params
      params.require(:cart_item).permit(:count)
    end

end
