class Publisher < ApplicationRecord
  has_many :books

  validates :country, presence: true
  validates :fundation, presence: true
end
