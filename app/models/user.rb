class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  before_save :send_welcome_email

  def send_welcome_email
    puts 'Sending welcome email...'
    WelcomeEmailWorker.perform_in(10) if self.confirmed_at_changed?
  end
end
