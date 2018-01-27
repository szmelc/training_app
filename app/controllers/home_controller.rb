class HomeController < ApplicationController
  before_action :authenticate_user!
  expose :user

  def index
  end
end
