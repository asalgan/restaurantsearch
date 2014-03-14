require 'rubygems'
require 'oauth'

consumer_key = 's6UeHCy2J8VPNinsqBa_gw'
consumer_secret = 'Mu3MU-Ie60M3aTAau4FMFWDTpPI'
token = 'hVMa8_CVqL2H6qEn8NBSkiOn7MilSVy1'
token_secret = 'bkfv6A3SuygrFShql5PD8jg5A8Y'

api_host = 'api.yelp.com'

consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
access_token = OAuth::AccessToken.new(consumer, token, token_secret)

path = "/v2/search?term=restaurants&location=chicago"

p access_token.get(path).body

# p access_token.get(path).body['businesses']