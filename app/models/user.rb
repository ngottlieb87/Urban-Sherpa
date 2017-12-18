class User < ApplicationRecord
  has_one :account
  validates :user_name, presence: true
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true
  validates_confirmation_of :password, presence: true
  validate :password_complexity
  attr_accessor :password
  before_save :encrypt_password

  def password_complexity
    if password.present?
       if !password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{7,15}$/)
         errors.add :password, "Password complexity requirement not met"
       end
    end
  end

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
  end

  def self.authenticate(email, password)
   user = User.find_by "email = ?", email
   if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
     user
   else
     nil
   end
 end
end
