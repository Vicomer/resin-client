
class Requester

  def initialize(token)
    @host = Envs.resin_host
    @token = token
    @json_client = JSONClient.new
    @json_client.default_header = {'Authorization' => "Bearer #{@token}"}
  end

  def get(endpoint)
    resp = @json_client.get(@host + endpoint)
    raise RuntimeError.new("Invalid token") if resp.code == 401
    resp.body
  end

  def post(endpoint, payload)

  end
end