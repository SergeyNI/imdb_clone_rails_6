require 'rails_helper'

RSpec.describe "Home", type: :request do
  describe "GET /index" do
    # pending "add some examples (or delete) #{__FILE__}"
    it 'render template home/index' do
      get "/home/index"
      expect(response).to render_template('home/index')
    end
    
    
  end
  describe 'root path' do
    it 'render template home/index' do
      get "/"
      expect(response).to render_template('home/index')
    end
  end

  describe 'even else path' do
    it 'render template home/index' do
      get "/qwerty/index"
      expect(response).to redirect_to('/')
    end
  end
end
