Rails.application.routes.draw do

  resources :authors do
    resources :books
  end

  delete '/authors/:author_id/soft_delete', to: 'authors#soft_destroy', as: :author_soft_destroy
  delete '/authors/:author_id/hard_delete', to: 'authors#hard_destroy', as: :author_hard_destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
