FactoryBot.define do
    factory :genre do
        literary_genres { FFaker::Book.literary_genres }
    end
end