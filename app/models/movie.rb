class Movie < ApplicationRecord
  belongs_to :category
  has_one_attached :video
  ratyrate_rateable "rate"
end
