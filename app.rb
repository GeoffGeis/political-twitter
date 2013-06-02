require './storm'
require 'ssl_certifier'

def parse_file(f)
  tweets = []
  file = File.new(f, 'r')
  file.each_line("\n") do |row|
    tweets << row.chomp if row.chomp.length < 140
  end
  tweets
end

tweets = parse_file './tweets'
config = {}
config[:consumer_key] = "23vyq5tfgN9Mr2ZgmWWaQ"
config[:consumer_secret] = "8dUwJsl6bDS3Dn38gwKMatffXwZ4vh2SvDGPp1M"
config[:oauth_token] = "1475732792-5d4Q4LxcxgZZ2U27Db7maBA0lRmS2hg5HYXmhfm"
config[:oauth_token_secret] = "WE3hIyEhIIjPPb6yglaT512XPtiS9b01mHsSjsNdi0"

client = Storm.new(config)
client.tweet_all tweets