# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Magazines', type: :request do
  describe '#index' do
    subject(:index_magazines) { get '/v1/magazines' }

    it { is_expected.to eq(200) }
  end

  describe '#show' do
    subject(:show_magazines) { get "/v1/magazines/#{magazine_id}" }

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
    subject(:post_magazines) { post '/v1/magazines', params: params.as_json }

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
    subject(:put_magazines) { put "/v1/magazines/#{magazine.id}", params: params.as_json }

    let!(:magazine) { create(:magazine) }

    context 'with valid arguments' do
      let(:params) { { magazine: { title: 'Revista do Seu Zé' } } }

      it "then updates magazine's title" do
        expect { put_magazines }.to(change { magazine.reload.title })
      end
    end

    context 'with invalid arguments' do
      let(:params) { { magazine: { title: '' } } }

      it "then should not change magazine's title" do
        expect { put_magazines }.not_to(change { magazine.reload.title })
      end
    end
  end

  describe '#destroy' do
    subject(:delete_magazines) { delete "/v1/magazines/#{magazine_id}" }

    let!(:magazine_id) { create(:magazine).id }

    context 'with valid arguments' do
      it { expect { delete_magazines }.to change(Magazine, :count).by(-1) }
    end

    context 'with invalid arguments' do
      let(:magazine_id) { -1 }

      it 'then should not destroy the magazine' do
        expect { delete_magazines }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
