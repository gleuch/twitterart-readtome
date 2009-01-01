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
    match('/stories').to(:action => 'index').name(:stories)
    match('/stories/publish').to(:action => 'publish').name(:story)
    match('/stories/:id').to(:action => 'show').name(:story)
    #with :controller => 'games' do
    #  match('/stories/:story_id/games/').to(:action => 'index').name(:stories)
    #  match('/stories/:story_id/games/:id').to(:action => 'show').name(:story)
    #end
  end

  slice(:merb_auth_slice_password, :name_prefix => nil, :path_prefix => "")
end