class UserItemsController < ApplicationController
  before_action :set_order, only: [:index, :create]

  def index
    @order_card = OrderCard.new
  end

  def create
    @order_card = OrderCard.new(order_params)
    if @order_card.valid? 
      @order_card.save
      redirect_to root_path
    else
        render action: :index
    end 
  end

 private

  def order_params
    params.require(:order_card).permit(:postal_code, :prefecture, :city, :address, :building, :phone_number)
  end 

  def set_order
    @item = Item.find(params[:item_id])
  end

end
