class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    return if tweet.published?
      tweet.publish_to_twitter!
    

    return if tweet.publish_at < Time.current

      tweet.publish_to_twitter!
    end
end
