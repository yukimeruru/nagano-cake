class Public::OrdersController < ApplicationController

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
  
    def order_params
      params.require(:order).permit(:shipping, :final_price, :payment_method, :name, :post_code, :address, :order_status)
    end

end
