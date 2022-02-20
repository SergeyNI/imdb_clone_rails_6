require 'rails_helper'
RSpec.describe FilmsController, :type => :controller do
  describe 'show' do
    describe "existing movie" do
      before(:each) do
        @movie = FactoryBot.create(:movie)
      end
      it  do
        get 'show', params: {id: @movie.friendly_id}
        expect(response).to render_template("show")
      end
    end
    describe 'with Fake ID' do
      it  do
        get 'show', params: {id: Faker::Name.first_name}
        expect(response).to redirect_to root_path
      end
    end
        
    
    
  end
  

end