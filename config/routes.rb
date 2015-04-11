Lockerman::Application.routes.draw do

  get "lockers/reservation", as: :make_reservation
  put "lockers/reserve" => "lockers#reserve", as: :reserve_locker
  get "lockers/return-locker" => "lockers#return_locker", as: :return_locker
  put "lockers/return" => "lockers#return", as: :locker_return
  get "lockers/receipt/:id" => "lockers#receipt", as: :receipt
  resources :lockers, :only => [:index]

  root 'welcome#index'
end
