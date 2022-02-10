class Category < ApplicationRecord
  validates :name, presence: true 
  extend FriendlyId
  friendly_id :name, use: :slugged
end
