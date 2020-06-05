Rails.application.routes.draw do
  

  constraints format: :json do
    
    
    resources :profile, only: [:index]
    resources :images, only: [:index, :create]
    devise_for :users,
             controllers: {
               sessions: 'sessions'
             }
    
    
    
  end
end
