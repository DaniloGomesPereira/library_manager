# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :publisher
  
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  has_many :genre_books, dependent: :destroy
  has_many :genres, through: :genre_books

  accepts_nested_attributes_for :author_books
  accepts_nested_attributes_for :genre_books

  validates :title, :publisher_id, presence: true
end
