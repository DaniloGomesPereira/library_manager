# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Publishers', type: :request do
  describe '#index' do
    subject (:index_publisher) { get '/publishers' }

    it { is_expected.to eq(200) }
  end

  describe '#show' do
    subject (:show_publishers) { get "/publishers/#{publisher_id}" }

    context 'When Publisher exist' do
      let!(:publisher_id) { create(:publisher).id }

      it { is_expected.to eq(200) }
    end

    context 'When publisher does not exists' do
      let(:publisher_id) { -1 }

      it 'Then raise record not found' do
        expect { show_publishers }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe '#create' do
    subject (:post_publishers) { post '/publishers', params: params.as_json }

    let(:params) do
      {
        publisher: {
          name: 'Editora Divertida',
          fundation: '1987-01-10',
          country: 'Brazil'
        }
      }
    end

    context 'When valid arguments' do
      it 'Then save the Publisher' do
        expect { post_publishers }.to change(Publisher, :count).by(1)
      end
    end

    context 'When invalid arguments' do
    let(:params) do
      {
        publisher: {
          name: '',
          fundation: '1987-01-10',
          country: 'Brazil'
        }
      }
    end
    it 'then should not create a new record' do
      expect { post_publishers }.not_to change(Publisher, :count)
    end
  end

    describe '#update'
    subject(:put_publishers) { put "/publishers/#{publisher.id}", params: params.as_json }

    let!(:publisher) { create(:publisher) }

    context 'Whit valid arguments' do
      let(:params) { { publisher: { name: 'Editora Divertida' } } }

      it "Then update publisher's name" do
        expect { put_publishers }.to change { publisher.reload.name }
      end
    end

    context 'With invalid arguments' do
      let(:params) { { publisher: { name: '' } } }

      it "Then should not update publisher's name" do
        expect { put_publishers }.not_to change { publisher.reload.name }
      end
    end
  end

  describe '#destroy' do
    subject(:delete_publishers) { delete "/publishers/#{publisher_id}" }

    let!(:publisher_id) { create(:publisher).id }

    context 'With valid arguments' do
      it { expect { delete_publishers }.to change(Publisher, :count).by(-1) }
    end

    context 'With invalid arguments' do
      let!(:publisher_id) { -1 }

      it 'Then should not destroy the publisher' do
        expect { delete_publishers }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
