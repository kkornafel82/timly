Rails.application.routes.draw do
  

  resources :businesses do
   resources :appointments, only: [:create, :destroy]

   post '/make_unavailable' => 'appointments#make_unavailable'
   
  end

  get 'users/show'

  devise_for :users

  get 'about' => 'welcome#about'

  get 'contact' => 'welcome#contact'

  root to: 'welcome#index'

end
