PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  # expose all the routes except destroy. [rake routes]
  resources :posts, except: [:destroy]
end
