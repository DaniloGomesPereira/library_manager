# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book do
  describe 'Given a book' do
   context "when it's valid" do
     let(:book) { build_stubbed(:book) }

     it { expect(book).to be_valid }
   end

    context "when it's not valid" do
      let(:book) { build(:book, title: nil) }

      it { expect(book).not_to be_valid } #dessa forma roda um texto "padrão do rspec"
    end
	end
end
