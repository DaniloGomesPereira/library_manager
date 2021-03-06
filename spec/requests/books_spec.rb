# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Books', type: :request do
  describe '#index' do
    subject(:index_books) { get '/v1/books' }

    it { is_expected.to eq(200) }
  end

  describe '#show' do
    subject(:show_books) { get "/v1/books/#{book_id}" }

    context 'when book exist' do
      let(:book_id) { create(:book).id }

      it { is_expected.to eq(200) }
    end

    context 'when book does not exist' do
      let(:book_id) { -1 }

      it 'then raise record not found' do
        expect { show_books }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe '#create' do
    subject(:post_books) { post '/v1/books', params: params.as_json }

    let(:publisher) { create(:publisher) }
    let(:author) { create(:author) }
    let(:genre) { create(:genre) }
    let(:params) do
      {
        book: {
          title: 'Diegão nas terras da Rainha',
          published_in: '2021-09-26',
          publisher_id: publisher.id,
          author_books_attributes: [
            {
              author_id: author.id,
              main_author: true
            }
          ],
          genre_id: genre.id
        }
      }
    end

    context 'with valid arguments' do
      it 'then save the book' do
        expect { post_books }.to change(Book, :count).by(1)
      end
    end
  end

  describe '#update' do
    subject(:put_books) { put "/v1/books/#{book.id}", params: params.as_json }

    let!(:book) { create(:book) }

    context 'with valid arguments' do
      let(:params) { { book: { title: 'Diegão de Kilt - Uma aventura na Escocia' } } }

      it "then updates book's title" do
        expect { put_books }.to(change { book.reload.title })
      end
    end

    context 'with invalid arguments' do
      let(:params) { { book: { title: '' } } }

      it "then should not updates book's title" do
        expect { put_books }.not_to(change { book.reload.title })
      end
    end
  end

  describe '#destroy' do
    subject(:delete_books) { delete "/v1/books/#{book_id}" }

    let!(:book_id) { create(:book).id }

    context 'with valid arguments' do
      it { expect { delete_books }.to change(Book, :count).by(-1) }
    end

    context 'with invalid arguments' do
      let(:book_id) { - 1 }

      it 'then should not destroy the book' do
        expect { delete_books }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
