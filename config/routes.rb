Rails.application.routes.draw do

  namespace :api, defaults: { format: :json }, module: nil do
    resources :imcs, only: [:index]
    post '/calculate_imc', to: "imcs#calculate_imc"
  end
end
