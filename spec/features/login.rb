require 'rails_helper'

RSpec.feature "LoginPage", type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
  end
  describe "success view page" do
    it 'visible title' do      
      expect(page).to have_text 'Log in'
    end
  end

  describe "success login" do
    it 'redirect to root_path' do
      fill_in "user[email]",	with: @user.email
      fill_in "user[password]",	with: @user.password
      click_button 'Log in'
      expect(page).to have_current_path(root_path)
    end
  end
  describe "failed login" do
    it 'show warning alert' do
      fill_in "user[email]",	with: @user.email
      fill_in "user[password]",	with: 'abrakadabra'
      click_button 'Log in'
      expect(page).to have_css('.alert.alert-warning')
    end
  end
  


  
end
