class CommentsController < ApplicationController
  before_action :set_commentable
  def create
    @comment = @commentable.comments.new(comments_params)
    @comment.user = current_user
    @comment.save
    redirect_to @commentable
  end

  private
    def comments_params
      params.require(:comment).permit(:text)
    end

    def set_commentable
      @commentable = Question.find(params[:question_id])
    end
end
