class PostsController < ApplicationController
  expose :post
  expose :posts
  expose :comment

  def show
    @post = post.decorate
    @comment = Comment.new(comment_params)
  end

  def new
    @post = current_user.posts.build(post_params)
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Post successfully created"
      redirect_to user_post_path(current_user, @post)
    else
      flash[:notice] = 'Dupa'
      render 'new'
    end
  end

  def edit
  end

  def update
    if post.update(post_params)
      redirect_to user_post_path(current_user, post)
    else
      render 'edit'
    end
  end

  def destroy
    post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content) if params[:post]
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id) if params[:comment]
  end
end
