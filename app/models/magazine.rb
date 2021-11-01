# frozen_string_literal: true

class Magazine < ApplicationRecord
  belongs_to :publisher

  validates :title, :published_in, :publisher_id, presence: true
end
