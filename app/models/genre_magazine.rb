# frozen_string_literal: true

class GenreMagazine < ApplicationRecord
  belongs_to :genre
  belongs_to :magazine
end
