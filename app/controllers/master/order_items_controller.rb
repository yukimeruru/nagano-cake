class Master::OrderItemsController < ApplicationController

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    if @order_item.make_status == "make"
      @order_item.order.update(order_status: 2)
    end
    order = @order_item.order
    order_items = order.order_items
    @total = 0
    order_items.each do |order_item|
      if order_item.make_status == "done_make"
        @total +=1
      end
    end
    if order_items.count == @total
      order.update(order_status: 3)
    end
    redirect_to master_order_path(@order_item.order_id)
  end


  private

    def order_item_params
      params.require(:order_item).permit(:price, :count, :make_status, :item_id)
    end

end
