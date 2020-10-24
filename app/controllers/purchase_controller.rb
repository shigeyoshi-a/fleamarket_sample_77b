class PurchaseController < ApplicationController
  require 'payjp'
  before_action :login_check
  before_action :set_card , :set_item , :address
  before_action :correct_user
  

  def index
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to new_card_path 
    else
      if Rails.env.development? || Rails.env.test?
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      else
        Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_PRIVATE_KEY]
      end
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    if Rails.env.development? || Rails.env.test?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_PRIVATE_KEY]
    end
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

  private

  def address
    @address = Address.find_by(user_id: current_user.id)
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def login_check
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
  end

  def correct_user
    if @item.saler_id == current_user.id or @item.buyer_id != nil
      redirect_to root_path
    end
  end

end
