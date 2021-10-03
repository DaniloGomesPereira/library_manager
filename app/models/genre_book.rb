# frozen_string_literal: true

class GenreBook < ApplicationRecord
  belongs_to :genre
  belongs_to :book
end
