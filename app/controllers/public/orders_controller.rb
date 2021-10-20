class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end
  
  def create
    
    
    @order.save
    redirect_to orders_thanks_path
  end
  
  def index
  end
  
  def show
  end
  
  def check
    @order = Order.new(order_params)
    if  params[:order][:address_number] == 0
      @order.post_code = current_member.post_code
      @order.address = current_member.address
      @order.name = current_member.first_name+current_menber.last_name
    elsif params[:order][:address_number] == 1
      @deliveries = Delivery.find(params[:order][:deliverise_id])
      @order.post_code = @deliveries.post_code
      @order.address = @deliveries.adresse
      @order.name = @deliveries.name
    elsif params[:order][:address_number] == 2
      @order.post_code = params[:order][:post_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render 'new'
    end
    
    @cart_item = CartItem.find(cart_item_params[:id])
  end
  
  def thanks
  end

  private
  
    def order_params
      params.require(:order).permit(:shipping, :final_price, :payment_method, :name, :post_code, :address, :order_status)
    end

end
