Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'},
                     :controllers => {:registrations => "registrations"}
  
  root to: 'pages#landing_page'

  resources :products

  resources :articles do
  resources :comments
  end

  resources :reviews

  resources :users, only: [:edit, :update, :show]

  get 'pages/landing_page'

  get '/contact' => "pages#contact"

  get '/about' => "pages#about"

  get 'form_input',   to: 'form_example#form_input'
  
  get 'form_output',  to: 'form_example#form_output'

  get 'contact_in',   to: 'contact#contact_in'
  
  get 'contact_out',  to: 'contact#contact_out'

  post 'payments/create'

  get 'payments/test_page'


  



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
