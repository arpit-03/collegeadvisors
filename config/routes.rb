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
       post 'payment/confirmed1', to: 'payment#confirmed1', as: 'api7'
  post 'payment/failed1',to: 'payment#failed1', as: 'api8'
    # post "payment/callback", to
  post "payment/calchash", to: 'payment#calchash', as:"hashgen"
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
  get 'home/slotbooked/:id', to: "home#slotbooked", as: 'slotbooked'
  get 'home/slotsuccess/:id', to: "home#slotsuccess", as: 'successbooked'
  get 'home/error', to: 'home#error', as: 'error'
  get 'user/showslots', to: 'user#showslots', as: 'showslots'
  get 'admin/showduration'
  get 'admin/showprice'
  get 'admin/showslots'
  get 'admin/showusers'
  get 'admin/unbookslot'
  get 'admin/deleteslot'
  get 'admin/changelink'
  get 'payment/confirmed',as:'confirmed'
  get 'payment/failed', as: 'failed'
  get 'home/about'
  get 'user/createsession/:user_id/:username', to: 'user#createsession', as:'createsession'
  post 'admin/changelink2', to: 'admin#changelink2', as: 'changelink'
  post 'admin/deleteslot2', to: 'admin#deleteslot2', as: 'deleteslot'
  post 'admin/unbookslot2', to: 'admin#unbookslot2',as:'unbookslot'
  post 'user/updatechangesinuser', to:'user#updatechangesinuser', as: 'updatechangesinuser'
  post '/admin/login/check' , to: 'admin#logincheck', as: 'admin'
  get '/admin/logout', to: 'admin#logout', as: 'adminlogout'
  post 'admin/changedefaults', to:"admin#changedefaults",as: 'changedefaults'
  post 'admin/createslots', to:"admin#createslots", as:"createslots"
  post 'admin/updateslots', to:"admin#updateslots", as:"updateslots"
  post 'admin/bookslots', to:"admin#bookslots", as:"bookslots"
  post 'admin/updatec1', to:"admin#updatec1", as:"updatec1"
  post 'admin/updatec2', to:"admin#updatec2", as:"updatec2"
  post 'admin/updatec3', to:"admin#updatec3", as:"updatec3"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
