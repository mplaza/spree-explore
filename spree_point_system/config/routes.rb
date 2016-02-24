Spree::Core::Engine.routes.draw do
  namespace :admin, path: '/admin' do
  	get '/point/agreement' => 'point_agreement#index'
  end
end
