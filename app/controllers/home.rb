class Home < Application
  # provides :xml, :yaml, :js

  def index
    @stories = Story.all(:current => 0, :started_at.lte => 0, :finished_at.lte => 0, :order => [:votes_up.asc, :created_at.asc])
    @current_story = Story.first(:current => 1, :order => [:started_at.desc])
    @previous_stories = Story.all(:current => 0, :finished_at.gt => 0, :order => [:finished_at.desc])

    display @stories
  end

end # Home