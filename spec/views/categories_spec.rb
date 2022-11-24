require 'rails_helper'

RSpec.describe 'Testing categories views', type: :feature do
  describe 'categories#index' do
    before(:each) do
      user = User.create! name: 'Anasse', email: 'anasse@example.com', password: '123456'
      (1..6).each { |i| user.categories.create name: "Test category #{i}", icon: fixture_file_upload('1-Entertainment.jpeg') }

      visit new_user_session_path
      fill_in 'Email', with: 'anasse@example.com'
      fill_in 'Password', with: '123456'
      click_button
      visit categories_path
    end

    it 'can see all the categories' do
      expect(page).to have_content 'Test category 1'
      expect(page).to have_content 'Test category 2'
      expect(page).to have_content 'Test category 3'
      expect(page).to have_content 'Test category 4'
      expect(page).to have_content 'Test category 5'
      expect(page).to have_content 'Test category 6'
    end
  end
end
