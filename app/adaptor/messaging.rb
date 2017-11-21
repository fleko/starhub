class Messaging

  def initialize(api_host)
    @connection ||= Excon.new( api_host )
    auth_response = @connection.post(path: '/authenticate',
                                     body: {name: 'starhub', password: '123secret'}.to_json,
                                     headers: { "Content-Type": "application/json" }
                                     )
    if auth_response.status == 200
      @auth_token = JSON.parse(auth_response.body).fetch('auth_token')
    else
      raise "Failed to authenticate with Messaging API"
    end

  end

  def send(msg)
    params = {content: msg[:content], originator: msg[:originator], recipient: msg[:recipient]}
    response = @connection.post(path: '/messages',
                                body: params.to_json,
                                headers: { "Content-Type": "application/json", 'Authorization': @auth_token  }
                                )
    response.status == 201
  end

  def receive(usrname, status=nil)
    query_hash = {mailbox: usrname}
    query_hash.merge!({status: status}) if status
    response = @connection.get(path: '/messages',
                               query: query_hash,
                               headers: { 'Authorization': @auth_token }
                               )

    response.status == 200
    JSON.parse(response.body)
  end
end
