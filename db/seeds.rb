# frozen_string_literal: true

Rails.logger.debug 'Creating books'
10.times do
  FactoryBot.create(:book)
end
