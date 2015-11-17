class Post < ActiveRecord::Base
  belongs_to :user

  validates :title,
  presence: true

  validates :link,
  presence: true,
  :url => true


end
