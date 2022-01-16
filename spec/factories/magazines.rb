# frozen_string_literal: true

FactoryBot.define do
  factory :magazine do
    transient do
      genre { create(:genre) }
    end

    title { FFaker::Book.title }
    published_in { Time.zone.today - rand(2..30).years }
    publisher
  end
end
