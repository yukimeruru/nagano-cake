class Master::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.all
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to master_order_path
  end

  private

    def order_params
      params.require(:order).permit(:shipping, :final_price, :payment_method, :name, :post_code, :address, :order_status)
    end

end
