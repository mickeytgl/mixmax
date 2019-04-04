require_relative "mixmax/version"
require "httparty"

class Mixmax
  include HTTParty

  def initialize(api_key)
    @headers = { "X-API-Token" => api_key}
  end

  base_uri "api.mixmax.com"

  def sequences
    self.class.get("/v1/sequences", headers: @headers).parsed_response["results"]
  end

  def sequence_recipients(id)
    self.class.get("/v1/sequences/#{id}", headers: @headers)
  end
  
  def add_to_sequence(id, recipients)
    self.class.post("/v1/sequences/#{id}/recipients", headers: @headers, body: recipients)
  end
end


# Mixmax.add_to_sequence(id, recipients)
# Mixmax.sequences
#
# curl -XPOST \
#    --header 'Content-Type: application/json' \
#    --header "X-API-Token: <your token>" \
#    https://api.mixmax.com/v1/sequences/593HF9J3IJ4JF30IF/recipients \
#    -d '{
#        "recipients": [{
#              "email": "hello@mixmax.com",
#              "variables": {
#                  "name": "Hugo Brockman",
#                  "email": "hello@mixmax.com"
#              }
#          },
#          {
#              "email": "careers@mixmax.com",
#              "variables": {
#                  "name": "Mixmax hello",
#                  "email": "careers@mixmax.com"
#              }
#          }],
#          "scheduledAt": 1490300970312
#      }'
#

# '{ "recipients": [{ "email": "migueltg93@gmail.com", "variables": { "name": "Mickey Mouse", "email": "mickeymouse@mailinator.com" }}], "scheduledAt": 1554404018 }'
