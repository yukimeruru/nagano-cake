class Master::OrderItemsController < ApplicationController
  
  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    redirect_to master_order_path(@order_item.order_id)
  end

  private

    def order_item_params
      params.require(:order_item).permit(:price, :count, :make_status, :item_id)
    end

end
