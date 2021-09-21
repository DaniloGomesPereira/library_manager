require 'rails_helper'

RSpec.describe 'Publishers', type: :request do
    describe '#index' do
        subject (:index_publisher) { get '/publishers'}

        it { is_expected.to eq(200) }
    end

    describe 'show' do
        subject (:show_publishers) { get "/publishers/#{publisher_id}" }

        context 'When Publisher exist' do
            let!(:publisher_id) { create(:publisher).id }

            it { is_expected.to eq(200)}
        end

        context 'When publisher does not exists' do
            let(:publisher_id) { -1 }

            it 'Then raise record not found' do
                expect { show_publishers }.to raise_error(ActiveRecord::RecordNotFound)
            end
        end
    end
end