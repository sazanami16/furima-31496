class UserItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:index, :create]

  def index
    @order_card = OrderCard.new
    if current_user == @item.user || @item.user_item.present?
      redirect_to root_path
    end
  end

  def create
    @order_card = OrderCard.new(order_params)
    if @order_card.valid?
      @order_card.save
      pay_item
      redirect_to root_path
    else
     render 'index'
    end
  end

 private

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end 

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end
end
