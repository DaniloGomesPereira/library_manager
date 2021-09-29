require 'rails_helper'

RSpec.describe 'Books', type: :request do
    describe '#index' do
        subject(:index_books) { get '/books' }

        it { is_expected.to eq(200) }
    end

    describe '#show' do
        subject(:show_books) { get "/books/#{book_id}"}

        context "When book exist" do
            let!(:book_id) { create(:book).id }

            it { is_expected.to eq(200) }
        end

        context "When book does not exist" do
            let(:book_id) { -1 }

            it "Then raise record not found" do
                expect { show_books }.to raise_error(ActiveRecord::RecordNotFound)
            end
        end
    end

    describe '#create' do
        subject(:post_books) { post '/books', params: params.as_json }

        let(:params) do
            {
                book: {
                    title: 'Diegão nas terras da Rainha', 
                    published_in: '2021-09-26', 
                    publisher_id: '1',
                    author_id: '1',
                    genre_id: '1'
                }
            }
        end

        context 'With valid arguments' do
            it 'Then save the book' do
                expect { post_books }.to change(Book, :count).by(1)
            end
        end
    end
end