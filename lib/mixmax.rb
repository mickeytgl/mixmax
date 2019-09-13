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

  def sequences(query: {}, all: false)
    sequences = []
    next_param = ''

    loop do
      response = get "/v1/sequences/#{next_param}"
      sequences += response['results']
      return sequences unless response['hasNext'] && all
      next_param = "?next=#{response['next']}"
    end
  end

  def sequence(sequence_id)
    get "/v1/sequences/#{sequence_id}"
  end

  def sequence_recipients(sequence_id)
    get "/v1/sequences/#{sequence_id}/recipients"
  end

  def add_to_sequence(sequence_id, recipients:)
    post "/v1/sequences/#{sequence_id}/recipients", query: recipients
  end

  def user_preferences
    get '/v1/userpreferences/me'
  end

  def change_user_preferences(query: {})
    patch '/v1/userpreferences/me', body: query
  end

  def remove_recipient_from_sequence(sequence_id, emails:)
    post "/v1/sequences/#{sequence_id}/cancel", query: { emails: Array(emails) }
  end

  private

  def get(route, query: {})
    self.class.get(route, headers: headers, query: query).parsed_response
  end

  def post(route, query: {})
    self.class.post(route, headers: headers, body: query.to_json)
  end
end
