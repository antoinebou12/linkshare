# == Route Map
#
#                   Prefix Verb   URI Pattern                                 Controller#Action
#                 comments GET    /comments(.:format)                         comments#index
#                          POST   /comments(.:format)                         comments#create
#              new_comment GET    /comments/new(.:format)                     comments#new
#             edit_comment GET    /comments/:id/edit(.:format)                comments#edit
#                  comment GET    /comments/:id(.:format)                     comments#show
#                          PATCH  /comments/:id(.:format)                     comments#update
#                          PUT    /comments/:id(.:format)                     comments#update
#                          DELETE /comments/:id(.:format)                     comments#destroy
#         new_user_session GET    /users/sign_in(.:format)                    devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                    devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                   devise/sessions#destroy
#            user_password POST   /users/password(.:format)                   devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)               devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)              devise/passwords#edit
#                          PATCH  /users/password(.:format)                   devise/passwords#update
#                          PUT    /users/password(.:format)                   devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                     devise/registrations#cancel
#        user_registration POST   /users(.:format)                            devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                    devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                       devise/registrations#edit
#                          PATCH  /users(.:format)                            devise/registrations#update
#                          PUT    /users(.:format)                            devise/registrations#update
#                          DELETE /users(.:format)                            devise/registrations#destroy
#                like_link PUT    /links/:id/like(.:format)                   links#upvote
#             dislike_link PUT    /links/:id/dislike(.:format)                links#downvote
#            link_comments GET    /links/:link_id/comments(.:format)          comments#index
#                          POST   /links/:link_id/comments(.:format)          comments#create
#         new_link_comment GET    /links/:link_id/comments/new(.:format)      comments#new
#        edit_link_comment GET    /links/:link_id/comments/:id/edit(.:format) comments#edit
#             link_comment GET    /links/:link_id/comments/:id(.:format)      comments#show
#                          PATCH  /links/:link_id/comments/:id(.:format)      comments#update
#                          PUT    /links/:link_id/comments/:id(.:format)      comments#update
#                          DELETE /links/:link_id/comments/:id(.:format)      comments#destroy
#                    links GET    /links(.:format)                            links#index
#                          POST   /links(.:format)                            links#create
#                 new_link GET    /links/new(.:format)                        links#new
#                edit_link GET    /links/:id/edit(.:format)                   links#edit
#                     link GET    /links/:id(.:format)                        links#show
#                          PATCH  /links/:id(.:format)                        links#update
#                          PUT    /links/:id(.:format)                        links#update
#                          DELETE /links/:id(.:format)                        links#destroy
#                     root GET    /                                           links#index
#

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :comments

  devise_for :users
  resources :links do
  member do
    put "like", to: "links#upvote"
    put "dislike", to: "links#downvote"
  end
  resources :comments
end
  root "links#index"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
