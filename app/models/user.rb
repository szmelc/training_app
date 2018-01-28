class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: %i[google_oauth2]

  has_many :posts

  before_save :send_welcome_email
  after_initialize :default_values

  TITLES = [
    'Junior Ruby on Rails Developer',
    'Ruby on Rails Developer',
    'Senior Ruby on Rails Developer',
    'Front-end Developer',
    'Head of Technology'
  ]

  validates :title, inclusion: { in: TITLES }
  validates :country, inclusion: { in: CountrySelectInput::LIST }

  def default_values
    self.title = TITLES[0]
    self.country = 'Poland'
  end

  def is_not_google_account?
    provider != 'google_oauth2'
  end

  def self.from_omniauth(access_token)
      data = access_token
      user = User.where(email: data['info']['email']).first
      unless user
          user = User.create(
            provider: data['provider'],
            uid: data['uid'],
            name: data['info']['name'],
            email: data['info']['email'],
            country: 'Poland',
            title: TITLES[0],
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
