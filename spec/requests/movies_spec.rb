require 'rails_helper'

RSpec.describe "Movies", type: :request do
  describe "GET /index" do
    it 'without signin admin' do
      get "/movies"
      expect(response).to redirect_to('/admin/login')
    end
    
    it 'with signin admin' do
      get "/movies"
      expect(response).to render_template('index')
    end
    
  end
end
