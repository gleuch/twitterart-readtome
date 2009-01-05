class Application < Merb::Controller
  def previous_count
    @previous_stories.blank? ? Story.count(:current => 0, :finished_at.gt => 0, :order => [:finished_at.desc]) : @previous_stories.size
  end

  def current_story
    @current_story = Story.first(:current => 1, :order => [:started_at.desc])
  end
  before :current_story

  def config_values
    @configs = AppConfig.all()
  end
  before :config_values

end