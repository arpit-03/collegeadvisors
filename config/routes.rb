Rails.application.routes.draw do
  get 'user/index'
  get 'admin/index'
	  namespace :api do
  
    namespace :v1 do
    	get 'college/get', to: 'collegeget#returncollege', as: 'api1'
    	get 'stream/get', to: 'collegeget#returndegree', as: 'api2'
      post 'loginuser' , to: 'loginuser#login',as: 'api3'
       post 'signupuser' , to: 'loginuser#signupuser',as: 'api4'
       post 'confirmforgot', to: 'loginuser#confirmforgot', as: 'api5'
       post 'changepassword', to: 'loginuser#changepassword', as: 'api6'
    end
end
  get 'college/index/:id/:page' , to: 'college#index', as: 'college'
  get '/search/:stream/:id', to: 'home#show',as: 'show'
  get 'home/index'
  get 'home/index1'
  root 'home#index'
  get 'admin/login' , as: 'adminlogin'
  get 'admin/index' , as: 'adminindex'
  get 'user/login' ,as:"userlogin"
  get '/searchall/:query',to:'home#search',as:'search'
  get '/image/:name' => 'image#show', :as => :custom_image
  get 'admin/slotview/:id' , to: "admin#slotview" , as: "adminslotview"
  get 'user/signup', as:"signup"
  get 'user/updateuser', as:"updateuser" 
  get 'user/verify/:email/:token' , to: 'user#verify', as: 'verifyuser'
  get 'user/forgotpassword/:id/:token', to: 'user#forgotpassword', as: 'forgotpassword'
  get 'user/passwordchangeconfirmation', to: 'user#fpassconf',as: 'forgotpasswordconfirm'
  get 'user/signout', to: 'user#signout', as: 'usersignout'
  get 'home/bookslot', to: 'home#booking', as: 'bookslot'
  get 'home/bookconfirmation/:plan', to: 'home#bookconfirmation', as: 'bookconfirmation'
  post 'user/updatechangesinuser', to:'user#updatechangesinuser', as: 'updatechangesinuser'
  post '/admin/login/check' , to: 'admin#logincheck', as: 'admin'
  post 'admin/changedefaults', to:"admin#changedefaults",as: 'changedefaults'
  post 'admin/createslots', to:"admin#createslots", as:"createslots"
  post 'admin/updateslots', to:"admin#updateslots", as:"updateslots"
  post 'admin/bookslots', to:"admin#bookslots", as:"bookslots"
  post 'admin/updatec1', to:"admin#updatec1", as:"updatec1"
  post 'admin/updatec2', to:"admin#updatec2", as:"updatec2"
  post 'admin/updatec3', to:"admin#updatec3", as:"updatec3"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
