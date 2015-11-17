class Post < ActiveRecord::Base
  belongs_to :user

  validates :title,
  presence: true,
  length: { 
  	minimum: 10,
  	maximum: 100
  }

  validates :link,
  presence: true,
  :url => true

  validates :name,
  presence: true,
  length: {
  	maximum: 20
  }


end
