class Public::DeliveriesController < ApplicationController
  before_action :authenticate_member!
  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.member_id = current_member.id
    if @delivery.save
      redirect_to deliveries_path
    else
      @deliveries = Delivery.all
      render :index
    end
  end

  def index
    @deliveries = current_member.deliveries
    @delivery = Delivery.new
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      redirect_to deliveries_path
    else
      render :edit
    end
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to deliveries_path
  end

  private

    def delivery_params
      params.require(:delivery).permit(:name, :post_code, :address)
    end

end
