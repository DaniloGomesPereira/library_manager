class Book < ApplicationRecord
  belongs_to :publisher
  
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books

  accepts_nested_attributes_for :author_books

  belongs_to :genre

  has_many :genre_books, dependent: :destroy
  has_many :genre, through: :genre_books

  accepts_nested_attributes_for :genre_books
end

