# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author do
  describe 'Given an author' do
    context "when it's valid" do
      let(:author) { build(:author) }

      it 'then OK' do
        expect(author).to be_valid
      end
    end

    context "when it's not valid" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:nationality) }
      it { should validate_presence_of(:birthday) }
      # let(:author) { build(:author, name: nil) }

      # it 'then not OK' do
      #   expect(author).not_to be_valid      
    end
  end
end
