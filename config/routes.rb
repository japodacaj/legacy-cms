ContentManagement::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { :registrations => "users/registrations", :sessions => "users/sessions" }

  resources :pages

  resources :categories do
    get 'tags/:tag', to: 'posts#index', as: :tag
    resources :posts
  end

  resources :quick_links do
    member do
      post :sort
    end
  end

  namespace :admin do
    resources :home_pages
    resources :menus do
      member do
        post :sort
      end
    end
    resources :page_elements
    resources :sites
    resources :stylesheets
    resources :users
  end

  get '', to: 'admin/sites#show', constraints: lambda { |r| r.domain.present? && r.domain != 'bitbrews.com' }
  get '', to: 'admin/sites#show', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }

  get 'admin', to: 'admin#index'
  post 'admin', to: 'admin#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'static_pages#home'
  
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
