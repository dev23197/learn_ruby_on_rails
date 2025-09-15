Rails.application.routes.draw do
  resources :handles
 resources :brands, only: [ :index, :show ]
 resources :products, only: [ :index, :show ] do
end

resources :basket, only: [ :show, :update, :destroy ]

resolve("Basket") { route_for(:basket) }
end


# Advanced Controller

Rails.application.routes.draw do
  resources :handles
  get "*path", to: "restricted_list#index",
  constraints: lambda { |request| RestrictedList.retrieve_ips.include?
  (request.remote_ip) }
end


# Constarins in a block form

Rails.application.routes.draw do
  resources :handles
  constraints(RestrictedListConstraint.new) do
    get "*path", to: "restricted_list#index"
    get "*other-path", to: "other_restricted_list#index"
  end
end
