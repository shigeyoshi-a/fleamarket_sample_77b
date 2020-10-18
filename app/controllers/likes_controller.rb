# class LikesController < ApplicationController

#   before_action :set_item, only: [:create, :destroy]

#   def index
#     @items = Item.includes(:item_images).order("created_at DESC")
#   end

#   def create
#     @like = Like.create(item_id: params[:item_id],user_id: current_user.id)
#     redirect_to item_path(@item.id)
#   end

#   def destroy
#     @like = Like.find_by(item_id: params[:item_id],user_id: current_user.id)
#     @like.destroy
#     redirect_to item_path(@item.id)
#   end

#   def set_item
#     @item = Item.find(params[:item_id])
#   end

# end