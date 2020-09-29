class PayController < ApplicationController
  before_action :sign_in, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @pay = PayUserAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @pay = PayUserAddress.new(pay_params)
   if @pay.valid?
    @pay.save
    return  redirect_to root_path
   else
    render "index"
   end
  end

  private

  def pay_params
    params.require(:pay_user_address).permit(:user_id,:item_id,:pay_id,:area_id,:postal_code,:city,:house_number,:telephone_number,:building_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  def sign_in
    unless current_user
      redirect_to new_user_session_path
    end
  end

end
