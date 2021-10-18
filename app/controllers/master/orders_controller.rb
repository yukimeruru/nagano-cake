class Master::OrdersController < ApplicationController

  def show
  end
  
  def update
  end
  
  private
  
    def order_params
      params.require(:order).permit(:shipping, :final_price, :payment_method, :name, :post_code, :address, :order_status)
    end

end
