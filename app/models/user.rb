class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { in: 6..20 }
  validates :email, :uniqueness => {:case_sensitive => false}
  
  def self.authenticate_with_credentials(email,password)
    self.where('trim(lower(email)) = ?', email.downcase.strip).first&.authenticate(password)
  end


  
end
