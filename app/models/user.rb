class User < ApplicationRecord
  has_secure_password
  before_validation :downcase_email
  has_many :posts

  validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }

  validates :password, presence: true, length: { minimum: 6 }

  private
  def downcase_email
    email.downcase! if email
  end

end
