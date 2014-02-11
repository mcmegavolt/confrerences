SciConferences::Application.routes.draw do

  filter :locale#, :exclude => %r(^admin/)

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  root 'home#index'

  resources :conferences, path: 'conf' do
    resources :categories, path: 'cat'
    resources :advertisings, path: 'adv'
  end
  resources :articles, path: 'art'

end
