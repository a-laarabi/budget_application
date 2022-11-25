require 'rails_helper'

RSpec.describe 'Records', type: :request do
  describe 'GET records#new' do
    before(:each) do
      user = User.create name: 'Anasse', email: 'anasse@example.com', password: '123456'
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      category = user.categories.create(name: 'entertainment', icon: fixture_file_upload('1-Entertainment.jpeg'))
      get new_category_record_path(category)
    end

    it 'should return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render correct template' do
      expect(response).to render_template(:new)
    end
  end
end
