require 'rails_helper'

RSpec.describe "Films", type: :request do
  describe "GET /films/:id" do
    before(:each) do
      @movie = FactoryBot.create(:movie)
    end
    it "returns http success" do
      
      get "/films/#{@movie.friendly_id}"
      expect(response).to have_http_status(:success)
    end
  end

end
