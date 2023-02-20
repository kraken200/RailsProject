Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: redirect('/about')
  get 'about', to: 'homepages#about', as: 'about'
  get 'home', to: 'homepages#home', as: 'home'
  get '/welcome', to: 'homepages#welcome', as: 'welcome'
  get 'users/:id', to: 'homepages#profile', as: 'user_profile'
  get 'home/groups/:id', to: 'homepages#home_group', as: 'home_group'
  

  get 'groups/show', to: 'groups#show', as: 'show_groups'
  get 'groups/new', to: 'groups#new', as: 'new_group'
  get 'groups/:id', to: 'groups#index', as: 'groups'
  get 'groups/:id/edit', to: 'groups#edit', as: 'edit_group'
  patch 'groups/:id', to: 'groups#update'
  post 'groups', to: 'groups#create', as: 'create_group'
  delete 'groups/:id', to: 'groups#destroy'
  

  get 'events', to: 'createevent#eventpage', as: 'events'
  get 'events/new', to: 'createevent#new', as: 'new_event'
  get 'events/:id', to: 'createevent#show', as: 'event'
  get 'events/:id/edit', to: 'createevent#edit', as: 'edit_event'
  patch 'events/:id', to: 'createevent#update'
  post 'events', to: 'createevent#create', as: 'create_event'
  delete 'events/:id', to: 'createevent#destroy'

  get 'teams/new', to: 'teams#new', as: 'new_team'

  get 'teams/:id/edit', to: 'teams#edit', as: 'edit_team'
  patch 'teams/:id', to: 'teams#update'
  post 'teams', to: 'teams#create', as: 'create_team'
  delete 'teams/:id', to: 'teams#destroy'
  get 'teams/:id', to: 'teams#index', as: 'team'
  get 'teams', to: 'teams#show', as: 'teams'
  post 'teams', to: 'teams#create'


  get 'groups/:id/players/edit', to: 'user_group_associations#edit', as: 'edit_group_players'
  delete 'groups/:group_id/users/:id', to: 'user_group_associations#destroy', as: 'remove_member'
  post 'groups/:group_id/users/:id', to: 'user_group_associations#create', as: 'add_member'
  patch 'groups/:group_id/users/:id', to: 'user_group_associations#update', as: 'star_player'

  
  post 'groups/:group_id/discussions', to: 'discussions#create', as: 'new_discussion'

  get 'teams/:id/players/edit', to: 'team_players#edit', as: 'edit_team_players'
  delete 'teams/:team_id/users/:id', to: 'team_players#destroy', as: 'remove_team_member'
  post 'teams/:team_id/users/:id', to: 'team_players#create', as: 'add_team_member'

  get 'events/:id/teams/edit', to: 'event_participations#edit', as: 'edit_event_participations'
  delete 'events/:event_id/teams/:id', to: 'event_participations#destroy', as: 'remove_event_member'
  post 'events/:event_id/teams/:id', to: 'event_participations#create', as: 'add_event_member'

  get 'venues', to: 'venues#index', as: 'venues'
  get 'venues/:id', to: 'venues#show', as: 'venue'
  delete 'venues/:id', to: 'venues#destroy'



end

