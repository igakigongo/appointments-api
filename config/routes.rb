Rails.application.routes.draw do
  #get '/', action: :index, controller: 'home'
  resources :appointments
end
