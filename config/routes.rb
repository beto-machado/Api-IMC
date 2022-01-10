Rails.application.routes.draw do

  post '/imcs', to: 'imcs#calculate_imc'
end
