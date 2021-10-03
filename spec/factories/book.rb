# frozen_string_literal: true

FactoryBot.define do
    factory :book do
        transient do # ele é quem recebe os parâmetros
            author { create(:author) }
            genre { create(:genre) }
        end

        title { FFaker::Book.title }
        published_in { Time.zone.today - rand(05..150).years }
        publisher

        after(:build) do |book, evaluator| # evaluator é  objeto que intera sobre os parâmetros do "transient"
            book.authors << evaluator.author
            book.genres << evaluator.genre
        end
    end
end
