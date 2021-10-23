class Master::OrderDetailsController < ApplicationController

  def update
    @order_item = find(params[:id])
  end

  private

    def order_item_params
      params.require(:order_item).permit(:price, :count, :make_status, :item_id)
    end

end
