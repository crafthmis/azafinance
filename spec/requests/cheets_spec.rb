require 'rails_helper'

RSpec.describe 'Creating and viewing Cheets per user' do
  it 'creates cheets' do
    user = User.create!(email: 'test@example.com')
    post "/users/#{user.id}/cheets", params: {message: "hello world"}

    expect(Cheet.first.message).to eq("hello world")
  end

  it 'allows viewing cheets per user' do
    user = User.create!(email: 'test@example.com')
    cheet = Cheet.create(message: 'hello world', user_id: user.id)

    get "/users/#{user.id}/cheets"
    response_data = JSON.parse(response.body)
    expect(response_data.length).to eq(1)
    expect(response_data.first).to include('message' => 'hello world')
  end
end