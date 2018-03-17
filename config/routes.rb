Rails.application.routes.draw do
  get 'profiles/show'

  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'posts#index'

  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # This will recognize /posts/1/like with GET, and route to the preview action of PostsController, with the resource id value passed in params[:id].
  # It will also create the like_post_url and like_post_path helpers
  resources :posts do
    resource :comments
    member do
      get 'like'
    end
  end


end
