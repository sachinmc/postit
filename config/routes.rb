PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  # expose all the routes except destroy. 'rake routes'
  resources :posts, except: [:destroy] do
    resources :comments, only: [:create]
  end

  # need only three routes
  resources :categories, only: [:new, :create, :show]

  # we want comment (now shown above) to be a nested resource
  # because we do not want to pollute top level namespace with all these resources
  # so instead of /comments, we want our form to post to /post/3/comments for example
  # that is a nested structure, we want a nested resource
  # resources :comments
  # to see the nested paths:
  # rake routes | grep comments
end
