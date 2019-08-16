Rails.application.routes.draw do
  root 'home#index'
  resources :books
  # get 'books/:id' => 'books#show', as: 'book'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
