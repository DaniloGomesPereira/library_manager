# frozen_string_literal: true

FactoryBot.define do
	factory :author do
		name { FFaker::NameBR.name }
		birthday { Time.zone.today - rand(10..90).years }
		nationality { 'Brazilian' }
	end
end