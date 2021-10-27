# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:publisher_id) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:authors) }
    it { is_expected.to have_many(:genres) }
  end
end
