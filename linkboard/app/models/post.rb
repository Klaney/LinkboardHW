class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :title,
  presence: true,
  length: { 
  	minimum: 10,
  	maximum: 100
  }

  validates :link,
  presence: true,
  :url => true
end
