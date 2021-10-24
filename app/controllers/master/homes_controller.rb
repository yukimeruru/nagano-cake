class Master::HomesController < ApplicationController

  def top
    @orders = Order.page(params[:page]).per(10)
  end

  private

  def order_params
    params.require(:order).permit(:shipping, :final_price, :payment_method, :name, :post_code, :address, :order_status)
  end
end
