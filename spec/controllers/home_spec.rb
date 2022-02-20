require 'rails_helper'
RSpec.describe HomeController, :type => :controller do
  
  describe "index" do
    it 'render template index' do
      get 'index'
      expect(response).to render_template('index')
    end
  end


end