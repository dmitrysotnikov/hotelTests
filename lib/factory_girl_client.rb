require 'faraday'
require 'json'
require 'active_support/core_ext/array/extract_options'

class FactoryGirlClient
  HEADERS = {'Accept' => 'application/json', 'Content-Type' => 'application/json'}.freeze
  ENDPOINT = '/api/factories'.freeze

  def initialize(host, username, password)
    @conn = Faraday.new(host).tap do |conn|
      conn.headers = HEADERS
      conn.basic_auth(username, password)
    end
  end

  def create(factory, *args)
    attributes = args.extract_options!
    body = {
      factory: factory,
      attributes: attributes,
      traits: args
    }
    perform_request('create', body)
  end

  def destroy(factory, id)
    perform_request('destroy', id: id, factory: factory)
  end

  private
  def perform_request(method, body)
    res = @conn.post("#{ENDPOINT}/#{method}", JSON.dump(body))
    raise res.inspect unless res.success?
    JSON.parse(res.body) if res.body.length > 1
  end
end

if __FILE__ == $0
  # Example usage:
  fg = FactoryGirlClient.new('http://wat.sensii.dev/', 'ci', 'testing')
  res = fg.create(:visitor, :staying, email: 'foo@example.com')
  puts res.inspect
  res = fg.destroy :visitor, res['id']
  puts res.inspect
end
