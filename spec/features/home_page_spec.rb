require 'rails_helper'

RSpec.feature "HomePages", type: :feature do
  before(:each) do
    @movie = FactoryBot.create(:movie) 
  end
  
  
  describe 'plain visit' do
    it do
      visit '/'
      expect(page).to have_css(".logo")
      expect(page).to have_text("Films")
      expect(page).to have_selector("video")
      
    end
  end

  describe 'go to film page after click on title video' do
    it do
      visit '/'
      within '.card' do
        click_link @movie.title
        expect(page).to have_current_path("/films/"+@movie.friendly_id)
      end
    end
  end
  describe 'rate system' do
    describe 'user logined' do
      before(:all) do
        Capybara.current_driver = :selenium
      end
      
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user, scope: :user)
      end
      
      it 'enabled' do
      
        visit '/'
        expect(page).to have_selector('div[class="star"][data-readonly="false"]')
      end
      it 'enabled to click on star' do
      
        visit '/'
        within 'div[class="star"][data-readonly="false"]' do
          element = page.find('img[alt="4"]')
          element.click
        end

        within 'div[class="star"]' do
          
          element = page.find('img[alt="4"]')
          src = element[:src]
          expect(src).to include('star-on')
         
        end
      end
      after(:all) do
        Capybara.current_driver = Capybara.use_default_driver
      end
      
    end
   
    it 'disabled' do
      visit '/'
      # expect(page).to have_css(".star")
      expect(page).to have_selector('div[class="star"][data-readonly="true"]')
      
    end

  end
  describe 'category system' do
    before(:each) do
      @movie_blockbuster = FactoryBot.create(:movie_blockbuster)
      @movie_romantic = FactoryBot.create(:movie_romantic)
      user = FactoryBot.create(:user)
      login_as(user, scope: :user)
    end
    describe "found 4 pills" do
      it  do
        visit '/'
        within 'ul.nav-pills.flex-column' do
          expect( all('.nav-link').count ).to eq(4)
        end
      end     
    end

    describe "filter by category" do
      it  do
        visit '/'
        within 'ul.nav-pills.flex-column' do
          page.find_link(@movie_romantic.category.name).click      
         
        end
        expect(page).to have_selector("video", :count => 1)
      end
    end    
  end

  describe "pagination" do
    before(:each) do
      @movie_blockbuster = FactoryBot.create(:movie_blockbuster)
      @movie_blockbuster_other = FactoryBot.create(:movie_blockbuster_other)
      @movie_romantic = FactoryBot.create(:movie_romantic)
      @movie_romantic_other = FactoryBot.create(:movie_romantic_other)
      @movies_count = Movie.all.count
      user = FactoryBot.create(:user)
      login_as(user, scope: :user)
    end
    
    it 'has pagination count video' do
      visit root_path
      expect(page).to have_selector("video", count: Kaminari.config.default_per_page)
    end
    
    it 'has paginator' do
      visit root_path
      expect(page).to have_selector(".pagination", count: 1)
    end
    
    it 'has difference count video after Next click' do
      visit root_path
      within 'ul.pagination' do
        page.find_link('Next').click
      end
      expect(page).to have_selector("video", count: @movies_count - Kaminari.config.default_per_page )
    end
  end
end
