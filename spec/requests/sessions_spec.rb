require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let!(:user) {create(:user)}

  describe "GET /new" do
    it "returns http success" do
      get login_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      post login_url, params: { user: {email: user.email, password: user.password} }
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      delete logout_url(user)
      expect(response).to redirect_to(login_path)
    end
  end

end
