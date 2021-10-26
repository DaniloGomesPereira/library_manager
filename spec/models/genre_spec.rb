# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Genre do
  describe 'Given a genre' do
    context "when it's valid" do
      let(:genre) { build(:genre) }

      it 'then OK' do
        expect(genre).to be_valid
      end
    end

    context "when it's not valid" do
      it { should validate_presence_of(:literary_genres) }
      # let(:genre) { build(:genre, literary_genres: nil) }

      # it 'then not OK' do
      #   expect(genre).not_to be_valid
      # end
    end
  end
end
