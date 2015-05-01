class Post < ActiveRecord::Base
  belongs_to :user
  has_many :votes, as: :votable
  has_many :comments

  validates :title,
    length: {
      minimum: 5,
      maximum: 100
    },
    presence: true

  validates :link,
    url: true,
    presence: true
end
