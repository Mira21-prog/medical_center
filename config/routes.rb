Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: 'patient/registrations'
}
  root "pages#home"
  resources :doctors, only:[:index, :show]
  resources :patients, only:[:show]
  resources :recommendations, only: [:new, :create, :show]
  resources :appointments, only:[:index, :create, :show, :new]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
