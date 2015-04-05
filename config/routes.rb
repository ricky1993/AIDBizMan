Rails.application.routes.draw do

  get 'common/index'

  get 'common/unhandled'

  get 'welcome/index'

  get 'welcome/about_us'

  get 'welcome/contact_us'

  resources :art_works

  get 'admin/users'

  get 'admin/apply_records'

  get 'admin/index'

  get 'find/findApply'

  get 'recieved/index'

  get 'recieved/show'

  get 'recieved/nav'

  resources :messages

  get 'edit_user/index'

  get 'edit_user/edit'

  post 'edit_user/show'

  get 'edit_user/othershow'

  get 'edit_user/handle'

  get 'edit_apply/customer_service'

  devise_for :users


  resources :apply_records

  get 'apply_records/find'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
