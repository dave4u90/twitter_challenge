Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  
  resources :users, only: [:edit, :show] do
    collection do
      get :tweets
    end
  end
    
  get '/users/:id/confirm_email' => 'users#email_confirmation', as: :email_confirmation
  patch '/users/:id/finish_signup' => 'users#finish_signup', as: :finish_signup

  devise_scope :user do
    root "devise/sessions#new"
  end
end
