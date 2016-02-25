Spree::Core::Engine.routes.draw do
  namespace :admin, path: '/admin' do
  	get '/point/agreement' => 'point_agreement#index'
  	get '/point/payments' => 'point_agreement#payments'
  end
end
