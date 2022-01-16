# frozen_string_literal: true

class Magazine < ApplicationRecord
  belongs_to :publisher

  has_many :genre_magazines, dependent: :destroy
  has_many :genres, through: :genre_magazines

  accepts_nested_attributes_for :genre_magazines

  validates :title, :published_in, :publisher_id, presence: true
end
