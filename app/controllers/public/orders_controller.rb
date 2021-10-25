class Public::OrdersController < ApplicationController
  before_action :authenticate_member!

  def new
    @order = Order.new
    @deliveries = current_member.deliveries
    p current_member
  end

  def create
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    @order.save


    current_member.cart_items.each do |cart_item|
      @order_item = OrderItem.new
      @order_item.item_id = cart_item.item_id
      @order_item.count = cart_item.count

      @order_item.price = (cart_item.item.price*1.1*cart_item.count).floor
      @order_item.order_id =  @order.id
      @order_item.save
    end

    current_member.cart_items.destroy_all
    redirect_to orders_thanks_path
  end

  def index
    @orders = current_member.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def check
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method].to_i
    p @order
    if  params[:order][:address_number] == "0"
      @order.post_code = current_member.post_code
      @order.address = current_member.address
      @order.name = current_member.first_name+current_member.last_name
    elsif params[:order][:address_number] == "1"
      @deliveries = Delivery.find(params[:order][:deliverise_id])
      @order.post_code = @deliveries.post_code
      @order.address = @deliveries.address
      @order.name = @deliveries.name
    elsif params[:order][:address_number] == "2"
      @order.post_code = params[:order][:post_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      if @order.post_code.empty?
        flash.now[:alert] = "記入もれがないか確認してください。"
        @deliveries = current_member.deliveries
        render 'new'
      elsif @order.address.empty?
        flash.now[:alert] = "記入もれがないか確認してください。"
        @deliveries = current_member.deliveries
        render 'new'
      elsif @order.name.empty?
        flash.now[:alert] = "記入もれがないか確認してください。"
        @deliveries = current_member.deliveries
        render 'new'
      end
    end
    @total = 0
  end

  def thanks
  end

  private

    def order_params
      params.require(:order).permit(:shipping, :final_price, :name, :post_code, :address, :order_status)
    end

    def order_item_params
      params.require(:order_item).permit(:item_id, :order_id, :price, :count, :make_status)
    end

end
