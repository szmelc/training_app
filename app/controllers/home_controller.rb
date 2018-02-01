class HomeController < ApplicationController
  before_action :authenticate_user!
  expose :user
  expose :posts, -> { PostsQuery.new.with_user.paginate(
                                                        page: params[:page],
                                                        per_page: 5
                                                        )
                    }

  def index
  end
end
