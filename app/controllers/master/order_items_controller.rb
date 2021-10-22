class Master::OrderDetailsController < ApplicationController

  def update
  end

  private

    def order_item_params
      params.require(:order_item).permit(:price, :count, :make_status, :item_id)
    end

end
