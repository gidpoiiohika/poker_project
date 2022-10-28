Rails.application.routes.draw do
  root to: 'poker/assets/leaderboard/events#index'
  
  namespace :poker do
    namespace :assets do
      namespace :leaderboard do
        resources :events, only: [:index, :show]
      end
    end
  end
end
