class SessionsController < ApplicationController
  protect_from_forgery with: :null_session
    def new  
    end  
  
     def create  
      user = User.find_by(email: params[:sessions][:email])
      #respond_to do |format|
      if user && user.authenticate(params[:sessions][:password])
       session[:user_id] = user.id 
       
       if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
     else
        cookies[:auth_token] = user.auth_token
      end
         redirect_to users_path, :notice => "Logged in!"
     else
      flash.now.alert = "Invalid email or password"
       render "new"
     end
   end
  
 
      
       #redirect_to users_path, :notice => "Logged in!"  
#       format.html { redirect_to users_path, notice: 'user login done' }
#       format.json { render json: @user }
#      else  
#         format.html { render :new }
#         format.json { render json: @user.errors }
        
#     end  
#   end 
# end 

  
  def destroy  
    session[:user_id] = nil  
    redirect_to root_url, :notice => "Logged out!"  
  end 
  end 