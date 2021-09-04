require 'rails_helper'

RSpec.describe 'Authors', type: :request do
    describe '#index' do
        subject(:index_authors) { get '/authors' }

        it { is_expected.to eq(200) }
    end

    describe '#show' do
        subject(:show_authors) { get "/authors/#{author_id}" }

        context 'when author exists' do
            let!(:author_id) { create(:author).id }

            it { is_expected.to eq(200) }
        end

        context 'when author does not exists' do
            let(:author_id) { -1 }

            it 'then raise record not found' do
                expect { show_authors }.to raise_error(ActiveRecord::RecordNotFound)
            end
        end
    end

    describe '#create' do
        subject(:post_authors) { post '/authors', params: params.as_json }

        let(:params) do
            {
                author: {
                    name: 'Diego da Silva',
                    nationality: 'Brazilian',
                    birthday: '2000-03-12'
                }
            }
        end

        context 'with valid arguments' do
            it 'then save the author' do
                expect { post_authors }.to change(Author, :count).by(1)
            end
        end
    end
end
