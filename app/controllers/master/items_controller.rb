class Master::ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end
   
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to master_items_path
  end
  
  def index
    @items = Item.all
  end

  def show
  end
  
  def edit
  end
  
  def update
  end
  
  private
  
    def item_params
      params.require(:item).permit(:name, :description, :image, :price, :sales_status)
    end

end
