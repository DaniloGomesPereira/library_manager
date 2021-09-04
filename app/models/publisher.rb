class Publisher < ApplicationRecord
  has_many :books

  validates :name, :country, :fundation, presence: true
end
