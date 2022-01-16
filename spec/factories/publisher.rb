# frozen_string_literal: true

FactoryBot.define do
  factory :publisher do
    name { FFaker::CompanyIT.name }
    fundation { Time.zone.today - rand(5..150).years }
    country { 'Italy' }
  end
end
