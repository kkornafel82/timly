Rails.application.routes.draw do
  
  root to: 'welcome#index'

  resources :charges, only: [:new, :create]

  resources :businesses do
    resources :appointments, only: [:create, :destroy] do
      put :make_unavailable
    end 
  end


  get 'users/show'

  devise_for :users

  get 'downgrade' => 'users#downgrade'

  # put 'make_unavailable' => 'appointments#make_unavailable'

  get 'about' => 'welcome#about'

  get 'contact' => 'welcome#contact'

 

end
