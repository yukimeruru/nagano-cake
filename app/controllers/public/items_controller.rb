class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @items = Item.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

  def search
    @items = Item.search(params[:keyword]).page(params[:page]).per(5)
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :image, :price, :sales_status, :genre_id)
    end
end
