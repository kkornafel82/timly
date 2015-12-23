Rails.application.routes.draw do
  
  root to: 'welcome#index'

  resources :businesses do
  
  resources :appointments, only: [:create, :destroy] do
    member do
    put :make_unavailable
    end
  end 
end

  patch '/make_unavailable' => 'appointments#make_unavailable'

  get 'users/show'

  devise_for :users

  get 'about' => 'welcome#about'

  get 'contact' => 'welcome#contact'

 

end
