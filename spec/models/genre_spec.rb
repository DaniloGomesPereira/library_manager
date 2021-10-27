# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Genre do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:literary_genres) }
  end
end
