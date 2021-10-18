Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :members, skip: [:passwords,], controllers:{
    registrations: "member/registrations",
    sessions: "member/sessions"
  }

  namespace :master do
    resources :items
    resources :genres
    resources :orders
    patch "order_items/:id" => "order_items#update"
    resources :members
  end

  scope module: :public do
    root "homes#top"
    get "about" => "homes#about"
    resources :items
    resources :cart_items
    delete "cart_items" => "cart_items#destroy_all"
    resources :orders
    get "orders/check" => "orders#check"
    get "orders/thanks" => "orders#thanks"
    resource :members
    get "members/out" => "members#out"
    patch "members/checkout" => "members#checkout"
    resources :deliveries
  end	
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
