class WelcomeEmailWorker < ApplicationMailer
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    email = user.email
    RegistrationMailer.welcome_email(email).deliver_now
  end
end
