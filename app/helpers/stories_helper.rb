module Merb
  module StoriesHelper

    def typeof_story list=false
      list ||= params[:list]
      case list
      when "upcoming"
        "Upcoming Reads"
      when "previous"
        "Previously Read"
      else
        "Currently Reading"
      end
    end

    def typeof_list_none list=false
      list ||= params[:list]
      case list
      when "upcoming"
        "There are no upcoming stories to be read."
      when "previous"
        "There have not been any stories previously read."
      else
        "There is not a current story being read."
      end
    end

    def typeof_story_none list=false
      list ||= params[:list]
      case list
      when "upcoming"
        "This story is no longer an upcoming read."
      when "previous"
        "This story is no longer available for reading."
      else
        "This story is not longer the current story being read."
      end
    end

  end
end # Merb