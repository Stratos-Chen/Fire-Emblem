Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end
  namespace :api do
    get "/list_of_Fire_Emblem_games" => "games#showcase_info"
    get "/builds" => "builds#index"
    post "/builds" => "builds#create"
    get "/builds/:id" => "builds#show"
    patch "/builds/:id" => "builds#update"
    delete "/builds/:id" => "builds#destroy"

    get "/users/:id" => "users#show"
    post "/users" => "users#create"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"
  end
end
