class PasswordResetsController < ApplicationController
      def new
	    end
	
       def create
       user = User.find_by_email(params[:email])
       User.send_password_reset(user)
	     if user
	     redirect_to root_url, :notice => "Email sent with password reset instructions."
	    end
    end


    def edit
	  @user =User.find_by_password_reset_token!(params[:id])
    end

    def update
    	Rails.logger.info"+++++++++++++++++++++==#{params.inspect}"
   	   @user = User.find_by_password_reset_token!(params[:password_reset_token])
      if @user
  	   @user.update_attributes(:password_reset_token => nil , :password => params[:password])
  		redirect_to root_url, :notice => "Password has been reset!"  
  	elsif 
     	redirect_to new_password_reset_path, :alert => "Password reset has expired."
  	else
    	render :edit
  	end
  end
end


# 	def update
#     @user=User.find_by_password_reset_token(params[:password_reset_token])
#     if @user
#     @user.update_attributes()
#     redirect_to new_password_reset_path, :alert => "Password has been reset."
#    else
#       redirect_to users_path
#   end
# end
# end
    # elsif #@user.update_attributes(params[:user])
    # redirect_to root_url, :notice => "Password has been reset!"
    # else
    # render :edit
    # end
 #    render json:
 #     {

	# 		:response_message => "password has been updated succesfully",
	# 		:response_code => "200"
	#  }

	# else
 #    render json:
 #    {
	# 		:response_message => "password not updated sucessfully",
	# 		:response_code => "400"
	# }


 #   end
 