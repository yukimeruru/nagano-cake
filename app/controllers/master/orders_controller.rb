class Master::OrdersController < ApplicationController

  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    if order.order_status == "check_pay"
      order.order_items.each do |order_item|
        order_item.update(make_status: 1)
      end
    end
    redirect_to master_order_path
  end

  private

    def order_params
      params.require(:order).permit(:shipping, :final_price, :payment_method, :name, :post_code, :address, :order_status)
    end

end
