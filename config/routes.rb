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
    resources :orders, only: [:index, :show, :update ]
    patch "order_items/:id" => "order_items#update",as: :order_item
    resources :members
  end

  scope module: :public do
    root "homes#top"
    get "about" => "homes#about"
    get 'search' => "searchs#search"
    resources :items
    resources :cart_items, only: [:create, :index, :update, :destroy ]
    delete "cart_items" => "cart_items#destroy_all" ,as: :destroy_cart_item
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