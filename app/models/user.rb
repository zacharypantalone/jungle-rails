class User < ApplicationRecord

  has_secure_password

  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :firstname, presence: true 
  validates :lastname, presence: true
  validates :password, length: { minimum: 5 } 

  def self.authenticate_with_credentials(email, password)
    self.find_by(email: email).try(:authenticate, password)
  end

    



end