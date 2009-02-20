ActionController::Routing::Routes.draw do |map|
  map.connect '', :controller => 'site', :action => 'greeting'

  map.resource  :account
  map.resource  :user
  map.resource  :spec
  map.resource  :preference
  map.resources :friendships
  map.resources :pictures, 
                :collection => {:select_main => :get},
                :member => {:select_as_main => :put}
  map.resources :invitations
  map.resources :groups
  map.resources :messages

  map.confirm_invitation 'confirm/:invitation_token', :controller => 'invitations', :action => "confirm"
  map.tmp_invite_only 'tmp_invite_only', :controller => "site", :action => "tmp_invite_only"
  map.login  'login',  :controller => 'user', :action => 'create'
  map.logout 'logout', :controller => 'user', :action => 'destroy'
  
  map.connect 'activate/:activation_code', :controller => 'account', :action => 'activate'
  
  map.connect ':controller/:action/:id'
end