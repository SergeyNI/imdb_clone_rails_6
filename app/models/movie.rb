class Movie < ApplicationRecord
  validates :title, :content, :video, presence: true
  belongs_to :category
  has_one_attached :video
  ratyrate_rateable "rate"
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :video, attached: true, content_type: ['video/mp4','video/mpeg', 'video/webm']
end
