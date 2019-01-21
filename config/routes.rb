Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#top'

  get    'sign_in/admin', to: 'sessions#admin_new', as: 'sign_in_admin'
  post   'sign_in/admin', to: 'sessions#admin_create'
  delete 'admin/sign_out', to: 'sessions#admin_destroy', as: 'sign_out_admin'
  get    'admin/sign_up', to: 'admins#new'
  post   'admin/sign_up', to: 'admins#create'

  get    'admin/camera_index', to: 'admins#camera_index', as: 'admin_camera_index'

  resources :manufacturers, only:['new', 'create', 'destroy']
  resources :cameras

end
