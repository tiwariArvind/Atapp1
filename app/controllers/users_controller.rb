class UsersController < ApplicationController

	protect_from_forgery with: :null_session
  before_filter :current_user, :only => [:destroy]
	before_action :authenticate,:except => [:new,:create, :destroy]
	#authenticated? 

	     def new
       @user=User.new
       end

       def show
       @user=User.find(params[:id])
       end

       def index
       @users=User.all
       end

	     def create 
       @user=User.create(permitted_params)
       if @user.save
       redirect_to @user
       else
       render 'new'
       end
    end



		#    @user=User.create(permitted_params)
		# #respond_to do |format|
	 #  	if @user.save
  #       redirect_to @user
	 # 	#format.html { redirect_to @user, notice: 'user was successfully created.' }
	 # #	format.json { render json: @user }
  #      else
  #       render 'new'
  #       # format.html { render :new }
  #        #format.json { render json: @user.errors }
  #     #end
  #    #end  
  #   end  
  # end

      def edit
      @user = User.find(params[:id])
      end 

      def update
      @user = User.find(params[:id])
      if @user.update(permitted_params)
      redirect_to @user
      else
      render 'edit'
    end
   end

     def destroy
      @user = User.find_by_id(params[:id])
      @user.destroy
      redirect_to root_url
     end
   
    private
      def permitted_params
       params.require(:user).permit(:name, :email, :password, :password_confirmation,:photo)
      end
    end  