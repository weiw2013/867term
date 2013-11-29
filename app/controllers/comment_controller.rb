class CommentController < ApplicationController
  before_filter :authenticate_user!, :only => [:create]
  def index
  end

  def create
    @comment = Comment.new (comment_params)
    @comment.user_id = current_user.id
    #@comment.course_id = params[:comment]["course_id"]
    @comment.save
    redirect_to :back
  end

  def new
    @comment = Comment.new
  end

  def destroy
  end

  def show
  end

  private
  def comment_params
    params.require(:comment).permit(:content,:course_id)
  end
end
