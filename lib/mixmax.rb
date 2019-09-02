require_relative 'mixmax/version'
require 'httparty'

class Mixmax
  include HTTParty

  attr_reader :headers

  def initialize(api_key)
    @headers = {
      'X-API-Token' => api_key, 'Content-Type' => 'application/json'
    }
  end

  base_uri 'https://api.mixmax.com'

  def sequences(query: {})
    get('/v1/sequences', query: query)['results']
  end

  def sequence(id)
    get "/v1/sequences/#{id}"
  end

  def sequence_recipients(id)
    get "/v1/sequences/#{id}/recipients"
  end

  def add_to_sequence(id, recipients:)
    post "/v1/sequences/#{id}/recipients", query: recipients
  end

  def user_preferences
    get '/v1/userpreferences/me'
  end

  def change_user_preferences(query: {})
    patch '/v1/userpreferences/me', body: query
  end

  def remove_recipient_from_sequence(sequence_id:, emails:)
    post "/v1/sequences/#{sequence_id}/cancel", query: { emails: Array(emails) }
  end

  private

  def get(route, query: {})
    self.class.get(route, headers: headers, body: query.to_json).parsed_response
  end

  def post(route, query: {})
    self.class.post(route, headers: headers, body: query.to_json)
  end
end
