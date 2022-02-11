require 'rails_helper'

RSpec.feature "HomePages", type: :feature do
  describe 'plain visit' do
    it do
      visit '/'
      byebug
    end
  end
end
