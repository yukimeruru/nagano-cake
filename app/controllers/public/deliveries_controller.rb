class Public::DeliveriesController < ApplicationController

  def create
  end
  
  def index
  end
  
  def edit
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
