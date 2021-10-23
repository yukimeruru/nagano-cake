class Master::HomesController < ApplicationController
  
  def top
    @orders = Order.page(params[:page]).per(10)
  end

end
