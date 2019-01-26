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
  resources :manufacturers, only:['new', 'create', 'destroy']

  resources :cameras
    get   'camera/search_result', to: 'cameras#search_result', as: 'camera_search_result'
  resources :users, only:['destroy']
  get    'unsubscribe', to: 'users#unsubscribe', as: 'unsubscribe_user'

  resources :news, only:['new', 'create', 'edit', 'update', 'destroy']
  get    'news/site_information', to: 'news#site_information'
  get    'news/camera_information', to: 'news#camera_information'
  get    'news/:id', to: 'news#show'

end
