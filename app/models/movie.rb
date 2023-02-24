class Movie < ApplicationRecord
  # belongs_to :bookmark
  has_many :bookmarks
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
