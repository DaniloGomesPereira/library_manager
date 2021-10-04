# frozen_string_literal: true

p 'Creating books'
10.times do
	FactoryBot.create(:book)
end