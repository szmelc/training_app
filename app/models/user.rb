class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: %i[google_oauth2]

  before_save :send_welcome_email

  TITLES = [
    'Junior Ruby on Rails Developer',
    'Ruby on Rails Developer',
    'Senior Ruby on Rails Developer',
    'Front-end Developer',
    'Head of Technology'
  ]

  def self.from_omniauth(access_token)
      data = access_token.info
      user = User.where(email: data['email']).first
      unless user
          user = User.create(name: data['name'],
             email: data['email'],
             password: Devise.friendly_token[0,20]
          )
      end
      user
  end

  def send_welcome_email
    @user = self
    # puts 'Sending welcome email...'
    WelcomeEmailWorker.perform_in(2, @user) if self.confirmed_at_changed?
  end
end
