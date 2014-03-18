AddressBook::Application.routes.draw do
  root 'application#index'

  namespace :api do
    namespace :v1 do
      resources :contacts
      resources :phone_numbers
    end
  end
end
