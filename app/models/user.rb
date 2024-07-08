class User < ApplicationRecord
  has_secure_password
  has_many :contributions, dependent: :destroy

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  default_scope { order(name: :asc) }

  def self.current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  VALID_EMAIL_REGEX = /\A[\w+\.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :name, presence: true,
                   length: { minimum: 3, maximum: 50 }
  validates :phone, length: { is: 10, message: "number should be 10 digits" },
                    numericality: { only_integer: true }
  validates :password, presence: true,
                       length: { minimum: 8 },
                       on: :create
  validates :password_confirmation, presence: true,
                                    on: :create

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
