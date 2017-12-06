
class Requester

  attr_reader :token

  def initialize(token)
    @host = Envs.resin_host
    @token = token
    @json_client = JSONClient.new
    @json_client.default_header = {'Authorization' => "Bearer #{@token}"}
  end

  def get(endpoint)
    encoded_url = URI.encode(@host + endpoint)
    resp = @json_client.get(encoded_url)
    raise RuntimeError.new("Invalid token") if resp.code == 401
    resp.body
  end

  def post(endpoint, payload)

  end

  def update_token
    @token = get('/whoami')
  end
end