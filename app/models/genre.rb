# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :genre_books, dependent: :destroy
  has_many :books, through: :genre_books
  has_many :genre_magazines, dependent: :destroy
  has_many :magazines, through: :genre_magazines

  validates :literary_genres, presence: true
end
