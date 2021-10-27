# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end
end
# describe 'Given a book' do
#  context "when it's valid" do
#    let(:book) { build_stubbed(:book) }

#    it { expect(book).to be_valid }
#  end
# end
