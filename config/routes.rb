Rails.application.routes.draw do

  devise_for :admins, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', confirmation: 'verification', registration: 'register' }
  
  scope module: 'admin' do
    root 'access_panel#index'
    resources :hospital_categories
    resources :treatment_categories
    resources :medical_equipments
    resources :other_facilities
    resources :diagnostic_facilities
    resources :qualifications
    resources :specializations
    resources :specialities
    resources :countries

    get 'access_panel/country_selector', as: 'country_selection'
    get 'access_panel/state_selector', as: 'state_selection'
    get 'access_panel/city_selector', as: 'city_selection'
    get 'access_panel/area_selector', as: 'area_selection'
    get 'access_panel/dashboard', as: 'admin_root'

    resources :states, except: [:create, :edit, :update, :delete, :new] do
      resources :cities
    end

    resources :cities, except: [:create, :edit, :update, :delete, :new] do
      resources :areas
    end

    resources :areas, except: [:create, :edit, :update, :delete, :new] do
      resources :hospitals
    end

    resources :countries, except: [:create, :edit, :update, :delete, :new] do 
      resources :states
    end

    resources :hospitals, except: [:create, :edit, :update, :delete, :new] do
      resources :doctors, except:[:index, :show]
      resources :schedules, only:[:new, :create, :delete, :edit]
    end
    
    resources :doctors do
      resources :schedules
    end


    get '/hospitals/:hospital_id/add_existing_doctor', to: 'doctors#existing_doctor_form', as:"add_existing_doctor"
    post '/hospitals/:hospital_id/add_existing_doctor', to: 'doctors#link_existing_doctor', as:"link_existing_doctor"
    get '/hospitals/:id/doctors/:doctor_id/unlink_doctor', to: 'hospitals#unlink_doctor', as: 'unlink_hospital_doctor'
    get '/doctors/:id/hospitals/:hospital_id/unlink_hospital', to: 'doctors#unlink_hospital', as: 'unlink_doctor_hospital'    
  end

  
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
