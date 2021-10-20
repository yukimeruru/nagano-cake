class Public::CartItemsController < ApplicationController

  def new
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.member_id = current_member.id
    @cart_item.save
    redirect_to cart_items_path
  end

  def index
    @cart_items = CartItem.all

  end

  def show
  end

  def check
  end

  def thanks
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private

    def cart_item_params
      params.require(:cart_item).permit(:count, :item_id)
    end

end
