require 'rails_helper'

RSpec.describe "UserSignups", type: :request do
  context "GET /user_signups" do
    it "works!" do
      get signup_path
      expect(response).to have_http_status(200)
    end
  end

  it 'valid' do
    post signup_path, params: {user: {name:'foo foo', email: 'foo.bar1@gmail.com', password: "foobar", password_confirmation: "foobar"}}
    expect(response).to have_http_status(302)
  end

  it 'invalid' do
    post signup_path, params: {user: {name:'foo foo', email: 'foo.bar1gmail.com', password: "foobar", password_confirmation: "foobar"}}
    expect(response).to have_http_status(400)
  end
end
