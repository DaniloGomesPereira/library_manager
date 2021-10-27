# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Publisher do
  describe 'inform a new Publisher' do
    context 'when is valid' do
      let(:publisher) { build(:publisher) }

      it 'then ok' do
        expect(publisher).to be_valid
      end
    end

    context "when it's not valid" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:country) }
      it { is_expected.to validate_presence_of(:fundation) }
      # let(:publisher) { build(:publisher, country: nil, fundation: nil) }

      # it 'then not OK' do
      #   expect(publisher).not_to be_valid
      # end
    end
  end
end
