class Home < Application
  # provides :xml, :yaml, :js

  def index
    @stories = Story.all(:current => 0, :started_at => nil, :finished_at => nil, :order => [:votes_up.asc, :created_at.asc])
    @previous_stories = Story.all(:current => 0, :finished_at.gt => 0, :order => [:finished_at.desc])

    display @stories
  end

end # Home