# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Magazines', type: :request do
  describe '#index' do
    subject (:index_magazines) { get '/magazines' }

    it { is_expected.to eq(200) }
  end

  describe '#show' do
    subject(:show_magazines) { get "/magazines/#{magazine_id}"}

    context 'when magazine exist' do
      let(:magazine_id) { create(:magazine).id }

      it { is_expected.to eq(200) }
    end

    context 'when magazine does not exist' do
      let(:magazine_id) { -1 }

      it 'then raise record not found' do
        expect { show_magazines }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe '#create' do
    subject(:post_magazines) { post '/magazines', params: params.as_json }

    let(:publisher) { create(:publisher) }
    let(:genre) { create(:genre) }
    let(:params) do
      {
        magazine: {
          title: 'Amazing Magazine',
          published_in: '2021-11-06',
          publisher_id: publisher.id,
          genre_id: genre.id
        }
      }
    end

    context 'with valid arguments' do
      it 'then save the magazine' do
        expect { post_magazines }.to change(Magazine, :count).by(1)
      end
    end
  end

  describe '#update' do
    it 'returns http success' do
      get '/magazines/update'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/magazines/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
