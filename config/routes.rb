Rails.application.routes.draw do
  get 'blogs', to: 'blogs#index'
  get 'blogs/:id', to: 'blogs#show', as: 'blog'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
