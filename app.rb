require './storm'
require 'ssl_certifier'

class App
  def initialize(target)
    @tweets = parse_file(target, './tweets')
    config = {}
    config[:consumer_key] = "23vyq5tfgN9Mr2ZgmWWaQ"
    config[:consumer_secret] = "8dUwJsl6bDS3Dn38gwKMatffXwZ4vh2SvDGPp1M"
    config[:access_token] = "1475732792-5d4Q4LxcxgZZ2U27Db7maBA0lRmS2hg5HYXmhfm"
    config[:access_token_secret] = "WE3hIyEhIIjPPb6yglaT512XPtiS9b01mHsSjsNdi0"
    @client = Storm.new(config)
    attack!
  end

  def parse_file(target, f)
    tweets = []
    file = File.new(f, 'r')
    file.each_line("\n") do |row|
      tweets << target + ' ' + row.chomp if row.chomp.length < 140
    end
    tweets
  end

  def attack!
    @client.tweet_all(@tweets)
  end
end

a = App.new('@target')
