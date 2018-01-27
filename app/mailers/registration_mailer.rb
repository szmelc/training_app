class RegistrationMailer < ApplicationMailer

  def welcome_email(user)
    mail(
      to: user.email,
      subject: 'Welcome to My Awesome Site'
    )
  end
end
