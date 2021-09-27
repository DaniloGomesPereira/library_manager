require 'rails_helper'

RSpec.describe 'Genre', type: :request do
    describe '#index' do
        subject(:index_genres) { get '/genres' }

        it { is_expected.to eq(200) }
    end

    describe '#show' do
        subject (:show_genres) { get "/genres/#{genre_id}" }

        context 'When Genre exits' do
            let!(:genre_id) { create(:genre).id }

            it { is_expected.to eq(200) }
        end

        context 'When Genre does not exist' do
            let(:genre_id) { -1 }

            it 'Then raise record not found' do
                expect { show_genres }.to raise_error(ActiveRecord::RecordNotFound)
            end
        end
    end

    describe '#create' do
        subject(:post_genres) { post '/genres', params: params.as_json }

        let(:params) { { genre: { literary_genres: 'Romance' } } }        
        
        context 'With valid arguments' do
            it 'Then save the Genre' do
                expect { post_genres }.to change(Genre, :count).by(1)
            end
        end 
        
        context 'With invalid arguments' do
            let(:params) { { genre: { literary_genres: '' } } }
            
            it 'Then should not create a new record' do
                expect { post_genres }.not_to change(Genre, :count)
            end
        end
    end
end