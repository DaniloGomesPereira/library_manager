class GenreBook < ApplicationRecord
  belongs_to :genre
  belongs_to :book
end
