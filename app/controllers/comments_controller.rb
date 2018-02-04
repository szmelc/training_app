class CommentsController < ApplicationController
  before_action :set_post
  load_and_authorize_resource :comment, through: :post
  expose :comment

  def new
  end

  def create
    if comment.save
      refresh_page
    end
  end

  def destroy
    refresh_page if comment.destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

  def refresh_page
    redirect_to request.referrer
  end
end
