
class Requester

  attr_reader :token

  def initialize(token)
    @host = Envs.resin_host
    @token = token
    @json_client = JSONClient.new
    @json_client.default_header = {'Authorization' => "Bearer #{@token}"}
  end

  def get(endpoint)
    encoded_url = get_uri(endpoint)
    resp = @json_client.get(encoded_url)
    check_response(resp)
    resp.body
  end

  def post(endpoint, payload)

  end

  def path(endpoint, payload)
    encoded_url = get_uri(endpoint)
    resp = @json_client.patch(encoded_url)
    check_response(resp)
    resp.body
  end

  def update_token
    @token = get('/whoami')
  end

  private
  def get_uri(endpoint)
    URI.encode(@host + endpoint)
  end

  def check_response(resp)
    raise RuntimeError.new("Invalid token") if resp.code == 401
  end
end