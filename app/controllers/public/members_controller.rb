class Public::MembersController < ApplicationController
  before_action :authenticate_member!
  def show
    @member = current_member

  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    if@member.update(member_params)
    redirect_to members_path,notice:'更新されました'
    else
    render "edit"
    end

  end

  def out
    @member=Member.find_by(email: params[:email])
  end

  def checkout
    @member = current_member
   if @member.update(member_status: false)
      reset_session 
      redirect_to root_path
   else
      render "show"
   end
  end

  private

    def member_params
      params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email, :password, :member_status)
    end
end
