class PostsController < ApplicationController
  expose :post
  expose :posts

  def show
    @post = post.decorate
    @comment = Comment.new(comment_params)
  end

  def new
    current_user.posts.build(post_params)
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = 'Post successfully created'
      redirect_to user_post_path(current_user, @post)
    else
      flash[:notice] = 'Post could not be saved.'
      render 'new'
    end
  end

  def edit
    authorize! :edit, post
  end

  def update
    authorize! :update, post
    if post.update(post_params)
      redirect_to user_post_path(current_user, post)
    else
      render 'edit'
    end
  end

  def destroy
    authorize! :destroy, post
    post.destroy
    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :all_tags) if params[:post]
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id) if params[:comment]
  end
end
