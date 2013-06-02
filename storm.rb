require 'twitter'
require 'ssl_certifier'

class Storm
  
  def initialize(cfg)
    Twitter.configure do |config|
      config.consumer_key = cfg[:consumer_key]
      config.consumer_secret = cfg[:consumer_secret]
      config.oauth_token = cfg[:oauth_token]
      config.oauth_token_secret = cfg[:oauth_token_secret]
    end
  end

  def tweet_this(message)
    Twitter.update(message)
  end

  def tweet_all(tweets)
  	tweets.each do |tweet|
      begin 
        tweet_this tweet
        puts "Tweeting: #{tweet}"
        sleep(Random.rand(220...360))
      rescue Exception => e
        puts "Tweet failed"
        puts e.message
        sleep(Random.rand(10..20))
      end
    end
  end

end