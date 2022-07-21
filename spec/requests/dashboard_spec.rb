require 'rails_helper'

RSpec.describe "Dashboard", type: :request do
  describe "GET /index" do
    it 'shows recent cheets' do
      subscriber = User.create!(email: 'test@example.com')

      author = User.create!(email: 'test2@example.com')
      cheet = Cheet.create!(user: author, message: "hello world")
      Subscription.create(subscriber_id: subscriber.id, subscribed_to_id: author.id)

      get "/users/#{subscriber.id}/dashboard"
      expect(JSON.parse(response.body).first['message']).to eq('hello world')
    end
  end
end
