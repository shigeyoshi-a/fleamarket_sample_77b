class LikesController < ApplicationController

  def index
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

end