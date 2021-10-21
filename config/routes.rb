Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }


  devise_for :members, skip: :all,controllers: {
    

  }

    devise_scope :member do
      get "members/sign_up" => "member/registrations#new",as: :new_member_registration
      post "members/sign_up" => "member/registrations#create"
      get "members/sign_in" => "member/sessions#new",as: :new_member_session
      post "members/sign_in" => "member/sessions#create"
      delete "members/sign_out" => "member/sessions#destroy",as: :destroy_member_session
    end


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
    post "orders/check" => "orders#check"
    get "orders/thanks" => "orders#thanks"
    resources :orders
    resource :members
    get "members/out" => "members#out"
    patch "members/checkout" => "members#checkout"
    resources :deliveries
  end


    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end