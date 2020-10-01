class PayController < ApplicationController
  before_action :authenticate_user!
  before_action :buy_params, only: [:index, :create]

  def index
    unless current_user
      redirect_to root_path
    else
      @pay = PayUserAddress.new
    end
  end

  def create
    @pay = PayUserAddress.new(pay_params)
   if @pay.valid?
    pay_item
    @pay.save
    return  redirect_to root_path
   else
    render "index"
   end
  end

  private

  def pay_params
    params.require(:pay_user_address).permit(:user_id,:item_id,:pay_id,:area_id,:postal_code,:city,:house_number,:telephone_number,:building_number).merge(user_id: current_user.id, item_id: params[:item_id], token: order_params[:token])
  end

  def buy_params
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.permit(:price,:token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

end
