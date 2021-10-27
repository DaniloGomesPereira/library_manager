# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:nationality) }
    it { is_expected.to validate_presence_of(:birthday) }
  end
end

# describe 'Given an author' do
#   context "when it's valid" do
#     let(:author) { build(:author) }

#     it 'then OK' do
#       expect(author).to be_valid
#     end
#   end

# let(:author) { build(:author, name: nil) }

# it 'then not OK' do
#   expect(author).not_to be_valid
