require 'test_helper'

describe MessagesController do

  AUTH_TOKEN = "123456"

  before do
    @customer =  customers(:sarah)
    expected_response = {"auth_token": AUTH_TOKEN}.to_json
    stub_request(:post, "#{MessagesController::API_HOST}/authenticate").
      with(body: {name: "starhub", password: "123secret"}.to_json,
           headers: {'Content-Type': 'application/json'}).
      to_return(status: 200, body: expected_response, headers: {})
  end

  it "shows unread messages for mailbox" do
    url = "#{MessagesController::API_HOST}/messages?mailbox=#{@customer.username}&status=1"
    expected_response = [{"id":3,"originator":"thomas","content":"this is my message","recipient":"fred","status":1}].to_json

    stub_request(:get, url).with( headers: {'Authorization': AUTH_TOKEN}).
      to_return( status: 200, body: expected_response, headers: {} )


    Customer.stub(:find, @customer) do
      get messages_index_url
      must_respond_with :success
    end
  end

  it "shows new message" do
    Customer.stub(:find, @customer) do
      get messages_new_url
      must_respond_with :success
    end
  end

  it "creates new message" do
    url = "#{MessagesController::API_HOST}/messages"
    test_message = {message: {content: 'this is a test',
                              originator: @customer.username,
                              recipient: 'fred'}}

    request_body = {content: "this is a test",
                    originator: "sarky",
                    recipient: "fred"}.to_json

    stub_request(:post, url).
      with(body: request_body,
           headers: {'Authorization': AUTH_TOKEN,
                     'Content-Type': 'application/json'}).
      to_return(status: 200, body: "", headers: {})


    Customer.stub(:find, @customer) do
      post messages_create_url, params: test_message
      must_respond_with :success
    end
  end

end
