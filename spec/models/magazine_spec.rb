# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Magazine do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:published_in) }
    it { is_expected.to validate_presence_of(:publisher_id) }
  end
end
