Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#top'

  get    'sign_in/admin', to: 'sessions#admin_new', as: 'sign_in_admin'
  post   'sign_in/admin', to: 'sessions#admin_create'
  delete 'admin/sign_out', to: 'sessions#admin_destroy', as: 'sign_out_admin'
  get    'admin/sign_up', to: 'admins#new'
  post   'admin/sign_up', to: 'admins#create'

  get    'user/sign_up', to: 'users#new'
  post   'user/sign_up', to: 'users#create'
  get    'sign_in/user', to: 'sessions#user_new', as: 'sign_in_user'
  post   'sign_in/user', to: 'sessions#user_create'
  delete 'user/sign_out', to: 'sessions#user_destroy', as: 'sign_out_user'

  get    'admin/camera_index', to: 'admins#camera_index', as: 'admin_camera_index'
  get    'admin/user_index', to: 'admins#user_index', as: 'admin_user_index'
  get    'admin/news_index', to: 'admins#news_index', as: 'admin_news_index'
  get    'admin/manufacturer_index', to:  'admins#manufacturer_index', as:  'admin_manufacturer_index'

  resources :manufacturers, only:['new', 'create', 'edit', 'update', 'destroy']

  resources :cameras do
    resources :favorites, only:['create', 'destroy']
    collection do
      get  'resolution_groups_index'
      get  'camera_type_groups_index'
      get  'manufacturer_groups_index'
    end
    resources :reviews, only:[:create, :edit, :update, :destroy]
  end
    get   'camera/search_result', to: 'cameras#search_result', as: 'camera_search_result'
    get   'camera/impression_ranking', to: 'cameras#impression_ranking', as: 'camera_impression_ranking'
  resources :users, only:['destroy']
  get    'unsubscribe', to: 'users#unsubscribe', as: 'unsubscribe_user'
  get    'user/access_histories', to: 'users#access_histories', as: 'user_access_histories'

  resources :news, only:['new', 'create', 'edit', 'update', 'destroy']
  get    'news/site_information', to: 'news#site_information'
  get    'news/camera_information', to: 'news#camera_information'
  get    'news/:id', to: 'news#show'

end
