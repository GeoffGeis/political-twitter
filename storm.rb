require 'twitter'
require 'ssl_certifier'

class Storm
  def initialize(cfg)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = cfg[:consumer_key]
      config.consumer_secret = cfg[:consumer_secret]
      config.access_token = cfg[:access_token]
      config.access_token_secret = cfg[:access_token_secret]
    end
    @random = Random.new
  end

  def tweet_this(message)
    @client.update(message)
  end

  def tweet_all(tweets)
  	tweets.each do |tweet|
      begin 
        tweet_this(tweet)
        puts "Tweeting: #{tweet}"
        sleep(@random.rand(220...360))
      rescue Exception => e
        puts "Tweet failed"
        puts e.message
        sleep(@random.rand(10..20))
      end
    end
  end
end
