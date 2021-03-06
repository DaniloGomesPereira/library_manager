# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Genre', type: :request do
  describe '#index' do
    subject(:index_genres) { get '/v1/genres' }

    it { is_expected.to eq(200) }
  end

  describe '#show' do
    subject(:show_genres) { get "/v1/genres/#{genre_id}" }

    context 'when Genre exits' do
      let(:genre_id) { create(:genre).id }

      it { is_expected.to eq(200) }
    end

    context 'when Genre does not exist' do
      let(:genre_id) { -1 }

      it 'then raise record not found' do
        expect { show_genres }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe '#create' do
    subject(:post_genres) { post '/v1/genres', params: params.as_json }

    let(:params) { { genre: { literary_genres: 'Romance' } } }

    context 'with valid arguments' do
      it 'then save the Genre' do
        expect { post_genres }.to change(Genre, :count).by(1)
      end
    end

    context 'with invalid arguments' do
      let(:params) { { genre: { literary_genres: '' } } }

      it 'then should not create a new record' do
        expect { post_genres }.not_to change(Genre, :count)
      end
    end
  end

  describe '#update' do
    subject(:put_genres) { put "/v1/genres/#{genre.id}", params: params.as_json }

    let!(:genre) { create(:genre) }

    context 'with valid arguments' do
      let(:params) { { genre: { literary_genres: 'Terror' } } }

      it 'then updates literary genres' do
        expect { put_genres }.to(change { genre.reload.literary_genres })
      end
    end

    context 'with invalid arguments' do
      let(:params) { { genre: { literary_genres: '' } } }

      it 'then should not update literary_genres' do
        expect { put_genres }.not_to(change { genre.reload.literary_genres })
      end
    end
  end

  describe '#destroy' do
    subject(:delete_genres) { delete "/v1/genres/#{genre_id}" }

    let!(:genre_id) { create(:genre).id }

    context 'with valid arguments' do
      it { expect { delete_genres }.to change(Genre, :count).by(-1) }
    end

    context 'with invalid arguments' do
      let(:genre_id) { -1 }

      it 'then should not destroy the genre' do
        expect { delete_genres }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
