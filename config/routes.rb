Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts

  root to: "posts#home"

  get '/home'=>'posts#home'

  get 'posts/category/food'=>'posts#food'

  get 'posts/category/fashion'=>'posts#fashion'

  get 'posts/category/books'=>'posts#book'

  get 'posts/category/toys'=>'posts#toy'

  get 'home/about'=>'home#about'

  get 'home/contact'=>'home#contact'
end
