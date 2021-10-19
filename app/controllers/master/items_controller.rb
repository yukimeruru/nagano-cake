class Master::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to master_item_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
    
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       redirect_to master_items_path(@item)
    else
      flash[:alert] = "商品が正常に保存されませんでした。"
       render "edit"
    end
    
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :image, :price, :sales_status, :genre_id)
    end

end
