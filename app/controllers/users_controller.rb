class UsersController < ApplicationController
  expose :user

  def show
    @user = user.decorate
  end
end
