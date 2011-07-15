OaCasportRails3::Application.routes.draw do
  match '/auth/:provider/setup',    :to => 'sessions#setup'
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/signout', :to => 'sessions#destroy', :as => :signout

  root :to => 'high_voltage/pages#show', :id => 'home'
end
