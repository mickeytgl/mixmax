require_relative "mixmax/version"
require "httparty"

class Mixmax
  include HTTParty

  def initialize(api_key)
    @headers = { "X-API-Token" => api_key, "Content-Type" => "application/json"}
  end

  base_uri "https://api.mixmax.com"

  def sequences(query = {})
    self.class.get("/v1/sequences", headers: @headers, query: query).parsed_response["results"]
  end

  def sequence(id)
    self.class.get("/v1/sequences/#{id}", headers: @headers).parsed_response
  end

  def sequence_recipients(id)
    self.class.get("/v1/sequences/#{id}/recipients", headers: @headers)
  end

  def add_to_sequence(id, recipients)
    self.class.post("/v1/sequences/#{id}/recipients", headers: @headers, body: recipients)
  end
end
