Merb.logger.info("Compiling routes...")
Merb::Router.prepare do
  #authenticate do
  #  namespace :admin do
  #    match('/').to(:controller => 'dash', :action => 'index').name(:dash)
  #    with(:controller => 'games') do
  #      match('/seasons/:season_id/games/:game_id/close', :method => :post).to(:action => 'distribute_winnings')
  #      match('/seasons/:season_id/games/:game_id/close').to(:action => 'close').name(:close_game)
  #    end
  #    resources :users
  #    resources :teams
  #    resources :seasons do
  #      resources :games
  #    end
  #  end
  #end

  with :controller => 'stories' do

    match('/stories/currently-reading/:id').to(:action => 'show', :list => 'current').name(:story)
    match('/stories/previously-read/:id').to(:action => 'show', :list => 'previous').name(:story)
    match('/stories/upcoming-reads/:id').to(:action => 'show', :list => 'upcoming').name(:story)

    match('/stories/currently-reading').to(:action => 'show', :list => 'current').name(:story)
    match('/stories/previously-read').to(:action => 'list', :list => 'previous').name(:stories)
    match('/stories/upcoming-reads').to(:action => 'list', :list => 'upcoming').name(:stories)

    match('/publish/:id').to(:action => 'publish').name(:story)

    match('/stories/:id').to(:action => 'show').name(:story)
    match('/stories').to(:action => 'index').name(:stories)
  end

  with :controller => 'votes' do
    match('/vote/:id').to(:action => 'index').name(:vote)
  end

  match('/').to(:controller => 'home', :action => 'index')
  match('/home').to(:controller => 'home', :action => 'index')
  match('/about').to(:controller => 'home', :action => 'about')
  match('/recommend').to(:controller => 'home', :action => 'recommend')

  slice(:merb_auth_slice_password, :name_prefix => nil, :path_prefix => "")
end