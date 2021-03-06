Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end
  namespace :api do
    get "/builds" => "builds#index"
    post "/builds" => "builds#create"
    get "/builds/:id" => "builds#show"
    patch "/builds/:id" => "builds#update"
    delete "/builds/:id" => "builds#destroy"

    get "/users/me" => "users#show"
    post "/users" => "users#create"
    patch "/users/me" => "users#update"
    delete "/users/me" => "users#destroy"
    post "/sessions" => "sessions#create"

    get "/heroes" => "heroes#index"
    get "/heroes/:name" => "heroes#show"

    get "/skills" => "skills#index"

  end

  get "/*path" => proc { [200, {}, [ActionView::Base.new.render(file: 'public/index.html')]]}
end
