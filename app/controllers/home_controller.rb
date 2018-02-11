class HomeController < ApplicationController
  before_action :authenticate_user!
  expose :user
  expose :posts, -> {
    PostsQuery.new.with_user.paginate(
      page: params[:page],
      per_page: 5
      )
    }

  def index
    if params[:tag]
      @posts = posts.tagged_with(params[:tag])
    else
      @posts = posts
    end
  end
end
