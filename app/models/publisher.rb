# frozen_string_literal: true

class Publisher < ApplicationRecord
  has_many :books

  validates :name, :country, :fundation, presence: true
end
