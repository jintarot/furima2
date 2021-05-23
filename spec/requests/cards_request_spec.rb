require 'rails_helper'

RSpec.describe 'Cards', type: :request do
  describe 'GET /create' do
    it 'returns http success' do
      get '/cards/create'
      expect(response).to have_http_status(:success)
    end
  end
end
