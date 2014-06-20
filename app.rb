require './storm'
require 'ssl_certifier'

class App
  def initialize(target)
    @tweets = parse_file(target, './tweets')
    config = {}
    config[:consumer_key] = ""
    config[:consumer_secret] = ""
    config[:access_token] = ""
    config[:access_token_secret] = ""
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
