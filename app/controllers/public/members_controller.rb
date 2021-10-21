class Public::MembersController < ApplicationController

  def show
    @member = current_member

  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    @member.update(member_params)
    redirect_to members_path

  end

  def out
    @member=Member.find_by(email: params[:email])
  end

  def checkout
    @member = current_member
    @member.update(member_status: false)
    redirect_to root_path
    
    
  end

  private

    def member_params
      params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email, :password, :member_status)
    end
end
