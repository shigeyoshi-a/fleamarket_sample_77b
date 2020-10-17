class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html{ redirect_to item_path(params[:item_id])}
      format.json
    end

  end
  def destroy
    if @comment.destroy
      @msg = "コメントを削除しました"
    else
      flash[:alert] = "削除に失敗しました"
      redirect_to item_path(params[:item_id])
    end
   
  end
  private
  def set_comment
    @comment = Comment.find(params[:id])
  end
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
