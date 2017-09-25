require 'validates_email_format_of'
class User < ApplicationRecord
  #   before_save { self.email = email.downcase }
  VALID_NAME_REGEX = /\A[A-Za-z\d]([-\w]{2,20}[A-Za-z\d])?\Z/i
  VALID_PASSWORD_REGEX =/(?=.*[A-Za-z])(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}/
  validates :name,  presence: true, length: { in: 5..20 }, format: {with: VALID_NAME_REGEX, :message => 'name should be  5-20 character long and aplphanumeirc only'}
  validates :email, presence: true
  #  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #  validates :email, presence: true, length: { maximum: 255 },
  #                    format: { with: VALID_EMAIL_REGEX },
  #                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { in: 8..20 }, format: {with: VALID_PASSWORD_REGEX, :message => 'password should contain letters, numbers and special symbol'}

  validates_email_format_of :email
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end


end
