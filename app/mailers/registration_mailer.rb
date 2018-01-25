class RegistrationMailer < ApplicationMailer

  def welcome_email
    mail(to: 'lszmelc@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
