Rails.application.routes.draw do
  get 'doctors/index'
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  resources :appointments, only: %i[index show create update]
  resources :doctors, only: %i[index]
end
