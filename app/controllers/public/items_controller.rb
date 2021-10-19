class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @items_page = Item.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :image, :price, :sales_status, :genre_id)
    end
end
