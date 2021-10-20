class Public::MembersController < ApplicationController

  def show
    @member = Member.find(params[:id])
    
  end
  
  def edit
  end
  
  def update
  end
  
  def out
  end
  
  def checkout
  end
  
  private
  
    def member_params
      params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email, :password, :member_status)
    end
end
