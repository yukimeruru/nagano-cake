class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end
  
  def create
    order = Oeder.new(order_params)
    order.save
    redirect_to orders_check_path
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
