require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET categories#index' do
    before(:each) do
      user = User.create name: 'Anasse', email: 'anasse@example.com', password: '123456'
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get categories_path
    end

    it 'should return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render correct template' do
      expect(response).to render_template(:index)
    end

    it "should render page contenting 'Categories'" do
      expect(response.body).to include('Categories')
    end
  end
end
