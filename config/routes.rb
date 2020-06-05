Rails.application.routes.draw do

  constraints format: :json do
    
    
    resources :profile, only: [:index]
    get 'profile/comments', to: 'profile#comment'
    get 'profile/images', to: 'profile#image'
    
    
    resources :images, only: [:index, :create] do
      resources :comments, only: [:index, :create]
    end
    devise_for :users,
             controllers: {
               sessions: 'sessions'
             }
    
    
    
  end
end
