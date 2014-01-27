SciConferences::Application.routes.draw do

  filter :locale, :exclude => %r(^admin/)

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  root 'home#index'

  resources :conferences, path: "conf" do
    resources :articles, path: "art"
  end

end
