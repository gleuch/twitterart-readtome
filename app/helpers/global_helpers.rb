module Merb
  module GlobalHelpers

    def twitter_link
      "http://www.twitter.com/#{TWITTER_NAMES[:"#{Merb.environment}"][:user]}"
    end

    def get_app_config(key)
      val = @configs.reject{|k,v| k.config_key != key}
      if (val.size > 0)
        val.first.config_value
      else
        ''
      end
    end

    def form_row label, content
      label + "<p>" + content + "</p>"
    end

    def make_tweet(story = @story, wrap = false)
      unless story.blank?
        snip = story.content.gsub(/\n/, " ").gsub(/( ){2,}/, " ")[story.character_at.to_i..(story.character_at.to_i + 141)].lstrip
        adjust = 0

        # Clean out left whitespace
        if snip.size == 142
          snip = snip.chop
          adjust = 1
        end  

        # Check if tweet is breaking last word, otherwise stop before word
        if snip[-1..-1] == ' '
          tweet = snip.rstrip
        else
          tweet = []
          snip.split(" ").each do |r|
            if (tweet.join(" ").size + r.size + 1) <= 140
              tweet << r
            end
          end
          tweet = tweet.join(" ")
        end

        unless wrap.blank?
          tweet = wrap.gsub(/\*/, tweet)
        end

        return [tweet, (tweet.size + adjust)]
      else
        ["", 0]
      end
    end


    def highlight_tweet(story = @story)
      tweet, size = make_tweet(story)
      story.content.gsub(/#{tweet}/, "<span class=\"highlight\">#{tweet}</span>")
    end

  end
end
