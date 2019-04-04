require "mixmax/version"
require "httparty"

module Mixmax
  include HTTParty
  base_uri "api.mixmax.com"
  # api_key = '90aa4d9c-53a0-41a8-860e-7a995a9a2f4e'
  # headers = {
  #   "X-API-Token" => api_key
  # }


  def self.sequences
    get("/v1/sequences", :headers => { "X-API-Token" => "90aa4d9c-53a0-41a8-860e-7a995a9a2f4e"})
  end
end


# Mixmax.add_to_sequence(id, recipients)
# Mixmax.sequences
