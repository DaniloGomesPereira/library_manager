# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Publisher do
  describe 'Inform a new Publisher' do
    context 'When is valid' do
      let(:publisher) {build(:publisher)}

      it 'then ok' do
        expect(publisher).to be_valid
      end
    end

    context "when it's not valid" do
		  let(:publisher) { build(:publisher, country: nil, fundation: nil) }

			it 'then not OK' do
				expect(publisher).not_to be_valid
      end
    end
  end
end
