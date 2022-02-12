require 'rails_helper'

RSpec.feature "FilmPages", type: :feature do
  
  describe "success view page" do
    before(:each) do
      @movie = FactoryBot.create(:movie) 
      visit "/film/#{@movie.friendly_id}"
    end
    it 'has title' do
      # visit "/film/#{@movie.friendly_id}"
      expect(page).to have_text(@movie.title)
    end

    it 'has video' do
      # visit "/film/#{@movie.friendly_id}"
      expect(page).to have_selector('video')
    end

    it 'has avarage rate' do
      # visit "/film/#{@movie.friendly_id}"
      within '#average_rate' do
        element = page.find("div")
        style = element[:style]
        expect(style).to include('background-image:url(/assets/big-star.png)')
      end    
     
    end
    
  end
  
end
