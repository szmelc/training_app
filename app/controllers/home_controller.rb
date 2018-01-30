class HomeController < ApplicationController
  before_action :authenticate_user!
  expose :user
  expose :posts, -> { PostsQuery.new.with_user }

  def index
  end
end
