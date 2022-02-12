class Category < ApplicationRecord
  validates :name, presence: true
  has_many :movies, class_name: "Movie", foreign_key: "category_id", dependent: :destroy
  extend FriendlyId
  friendly_id :name, use: :slugged
end
