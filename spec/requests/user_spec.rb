require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /name" do
    it "returns http success" do
      get "/user/name"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /email" do
    it "returns http success" do
      get "/user/email"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /password_digest" do
    it "returns http success" do
      get "/user/password_digest"
      expect(response).to have_http_status(:success)
    end
  end

end
