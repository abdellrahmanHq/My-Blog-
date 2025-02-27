Rails.application.routes.draw do

  devise_for :users
  
  resources :blog_posts do
    resource :cover_image, only: [:destroy], module: :blog_posts
  end

  # get "blog_posts/new", to:"blog_posts#new"
  # get "/blog_posts/:id",to: "blog_posts#show",as: :blog_post
  # patch "/blog_posts/:id",to: "blog_posts#update"
  # delete "/blog_posts/:id",to: "blog_posts#destroy"

  # get "/blog_posts/:id/edit",to: "blog_posts#edit",as: :edit_blog_post
  # post"/blog_posts",to:"blog_posts#create",as: :blog_posts

  root "blog_posts#index" 

end
