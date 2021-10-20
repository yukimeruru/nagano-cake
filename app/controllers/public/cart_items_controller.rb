class Public::CartItemsController < ApplicationController

  def new
  end
  
  def create
  end
  
  def index
    @cart_items = CartItem.all
  end
  
  def show
  end
  
  def check
  end
  
  def thanks
  end
  
  private
  
    def cart_item_params
      params.require(:cart_item).permit(:count, :item_id)
    end

end
