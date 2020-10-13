class LikesController < ApplicationController

  # before_action :set_item

  def index
    @item = Item.includes(:item_images).order("created_at DESC").limit(5)
  end

  def create
    Like.create(item_id: params[:item_id],user_id: current_user.id)
    redirect_to root_path
  end

  def destroy
    @like = Like.find_by(item_id: params[:item_id],user_id: current_user.id)
    @like.destroy
    redirect_to root_path
  end

  # def set_item
  #   @item = Item.find(params[:item_id])
  # end

end