require 'rails_helper'

RSpec.feature "FilmPages", type: :feature do
  
  describe "success view page" do
    before(:each) do
      @movie = FactoryBot.create(:movie) 
      visit "/films/#{@movie.friendly_id}"
    end
    it 'has title' do
      
      expect(page).to have_text(@movie.title)
    end

    it 'has video' do
      
      expect(page).to have_selector('video')
    end

    it 'has avarage rate' do
      
      within '#average_rate' do
        element = page.find("div")
        style = element[:style]
        expect(style).to include('background-image:url')
      end
     
    end
    
  end
  
end
