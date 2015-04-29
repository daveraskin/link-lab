class User < ActiveRecord::Base

  has_secure_password

  has_many :posts

  validates :email,
    email_format: { message: "doesn't look like an email address" },
    uniqueness: true

  validates :password,
    length: {
      minimum:8,
      maximum:30
    }

  validates :name,
    length: {
      minimum:2
    }


  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end
end
