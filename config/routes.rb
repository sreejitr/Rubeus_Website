Rubeus::Application.routes.draw do
  match '/about',    :to => 'static_pages#about_us',    via: 'get'
  match '/contact',    :to => 'static_pages#contact_us',    via: 'get'
  match '/tnc',    :to => 'static_pages#terms_and_conditions',    via: 'get'

  resources :products
  #resources :messages
  resources :offers, :except => [:show, :edit, :update] do
    member do
      get 'accept'
    end
  end
  #Path prefix makes devise controller actions different from users controller actions
  devise_for :users, :path_prefix => 'my' do get '/users/sign_out' => 'devise/sessions#destroy' end
  resources :users, :only => [:show, :edit, :update]
  root :to => "home#index"

  resources :users do
    resources :messages do
      collection do
        post :delete_selected
      end
    end
  end

  match '/my_products', to: 'products#current_user_product_index', via: 'get'
  #resources :messages

  #match '/show_interest', :controller => 'offers', :action => 'create'
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

#NEW URLS for products
 match '/search',   to: 'products#search'
end
