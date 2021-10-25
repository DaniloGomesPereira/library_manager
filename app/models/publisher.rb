# frozen_string_literal: true

class Publisher < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, :country, :fundation, presence: true
end
