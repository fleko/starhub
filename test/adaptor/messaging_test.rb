require_relative '../test_helper'

class MessagingTest < Minitest::Test
  API_HOST = 'http://localhost:3600'

  def setup
    @test_sender = 'test_sender'
    @test_recipient = 'test_recipient'

    expected_response = {"auth_token": '12345'}.to_json
    stub_request(:post, "#{API_HOST}/authenticate").
      with(body: {name: "starhub", password: "123secret"}.to_json,
           headers: {'Content-Type': 'application/json'}).
      to_return(status: 200, body: expected_response, headers: {})

    @gateway = Minitest::Mock.new(Messaging.new(API_HOST))
  end

  def test_send
    msg = {content: "this is a test", originator: @test_sender, recipient: @test_recipient}

    @gateway.expect(:send, true, [msg])
    @gateway.send(msg)
    assert_mock @gateway
  end

  def test_receive_all_statuses
    @gateway.expect(:receive, Hash, [@test_sender])
    res = @gateway.receive(@test_sender)
    assert_mock @gateway
  end

  def test_receive_specific_statuses
    status = 1
    @gateway.expect(:receive, Hash, [@test_sender, status])
    res = @gateway.receive(@test_sender, status)
    assert_mock @gateway
  end
end
