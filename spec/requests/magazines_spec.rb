# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Magazines', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/magazines/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/magazines/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/magazines/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
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
