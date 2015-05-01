class User < ActiveRecord::Base

  has_secure_password

  has_many :posts
  #votes about this user
  has_many :votes, as: :votable
  #votes cast by the user
  has_many :ballots, class_name: 'Vote'

  has_many :comments

  validates :email,
    email_format: { message: "doesn't look like an email address" },
    uniqueness: {case_senisiteve: false}

  validates :password,
    length: {
      minimum:8,
      maximum:30
    },
    presence:true,
    :on => :create

  validates :name,
    length: {
      minimum:2
    }


  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end
end
