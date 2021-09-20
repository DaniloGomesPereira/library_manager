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

        context 'with invalid arguments' do 
            let(:params) do
                {
                    author: {
                        name: '',
                        nationality: 'Brazilian',
                        birthday: '2000-03-12'
                    }
                }
            end
            it 'then should not create a new record' do
               expect { post_authors }.not_to change(Author, :count)
            end
        end    
    end
    
    describe '#update' do
        subject(:put_authors) { put "/authors/#{author.id}", params: params.as_json }

        let!(:author) { create(:author) }

        context 'with valid arguments' do
            let(:params) { { author: { name: "Diego"} } }

            it "Then updates the author's name" do
                expect { put_authors}.to change{author.reload.name}
            end
        end

        context 'With invalid arguments' do
            let(:params) { { author: { name: ""} } } 
              
            it "Then should not create the author's name " do
                expect { put_authors }.not_to change{ author.reload.name }
            end
        end
    end
    
    describe '#destroy' do 
        subject(:delete_authors) { delete "/authors/#{author_id}" }

        let!(:author_id) { create(:author).id }

        context 'with valid arguments' do
            it { expect { delete_authors }.to change(Author, :count).by(-1) }
        end

        context 'whit invalid arguments' do
          let!(:author_id) { -1 }

            it 'then should not destroy the author' do
                expect { delete_authors }.to raise_error(ActiveRecord::RecordNotFound)
            end
        end            
    end
end
