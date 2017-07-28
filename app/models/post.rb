class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
end
