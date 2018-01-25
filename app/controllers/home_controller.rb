class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    WelcomeEmailWorker.perform_in(10)
  end
end
