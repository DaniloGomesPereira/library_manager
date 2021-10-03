# frozen_string_literal: true

actoryBot.define do
    factory :genre do
        literary_genres { FFaker::Book.genre }
    end
end