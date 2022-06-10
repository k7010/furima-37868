class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_parames)
    if @comment.save
      redirect_to item_path(@comment.item)
    else
      @item = @comment.item
      @comment = @item.comments
      render "items/show"
    end
  end

  private
  def comment_parames
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
