class PurchaseController < ApplicationController
  require 'payjp'
  before_action :set_card , :set_item , :address

  def index
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to new_card_path 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
    :amount => @item.price,
    :customer => @card.customer_id,
    :currency => 'jpy',
    )
    redirect_to action: 'done' 
  end

  def done
    @item.update( buyer_id: current_user.id)
  end

  # def name
  #   @name = "#{@addres.receiving_famiry_name}"  "#{@addres.receiving_first_name}"
  # end

  private

  def address
    @address = Address.find_by(user_id: current_user.id)
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
