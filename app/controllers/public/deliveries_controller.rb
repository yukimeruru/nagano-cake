class Public::DeliveriesController < ApplicationController

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.save
    redirect_to deliveries_path
  end

  def index
    @deliveries = Delivery.all
    @delivery = Delivery.new
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

    def delivery_params
      params.require(:delivery).permit(:name, :post_code, :address)
    end

end
