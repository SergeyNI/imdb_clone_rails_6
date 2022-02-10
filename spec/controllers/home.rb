require 'rails_helper'
RSpec.describe HomeController, :type => :controller do
  
  describe "index" do
    it 'render template index' do
      get 'index'
      expect(response).to render_template('index')
    end
  end

  describe 'film' do
    before(:each) do
      @movie = FactoryBot.create(:movie)
    end
    it 'render template film' do
      
      get "film", params: {id: @movie.friendly_id}
      expect(response).to render_template('film')
    end
    describe 'not correct id' do
      it 'redirected to home/index' do
        get "film", params: {id: "fsdafd"}
        expect(response).to redirect_to action: 'index'
      end
    end 
  end

end