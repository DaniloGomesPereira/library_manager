# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :genre_books, dependent: :destroy
  has_many :books, through: :genre_books

  validates :literary_genres, presence: true
end
