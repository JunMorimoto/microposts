class User < ActiveRecord::Base
  before_save { self.email = self.email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
<<<<<<< HEAD
  has_many :microposts
=======
  validates :location, allow_blank: true, length: { minimum: 1, maximum: 30 }, on: :update
  validates :location, absence: true, on: :create
  validates :birthday, allow_blank: true, length: { minimum: 4, maximum: 10 }, on: :update
  validates :birthday, absence: true, on: :create
  validates :hobby, length: { maximum: 70 }, on: :update
  validates :hobby, absence: true, on: :create
>>>>>>> user-profile
end
