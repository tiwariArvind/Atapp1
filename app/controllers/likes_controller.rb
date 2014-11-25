class LikesController < ApplicationController
	protect_from_forgery with: :null_session


      def new
       @likes=Like.new
      end

       def index
         
        @user=User.find_by_id(params[:id])
        @event = Event.find_by_id(params[:id])
        @likes=Like.all
       end


       def create
       Rails.logger.info"+++++++++++#{params.inspect}"
       @user=User.find_by_id(params[:id]) 
      # @like = Like.new(params[:like])
       @event = Event.find(params[:event_id])
       @like = @event.likes.build(:user_id => params[:user_id])
       respond_to do |format|
       if @like.save
       #redirect_to  users_path(current_user)

        format.html { redirect_to @users_path, notice: 'event was like sucessfully' }
        format.json { render json: @like }
      else
         format.html { render :new }
         format.json { render json: @like.errors }
     # render 'new'
    end
  end
end


   #  def destroy
   #  @event = Event.find(params[:id]).liked
   #  current_user.unlike!(@event)
   #  redirect_to @user_events_path(current_user,@event)
   # end


  

    #    def index
    #     @likes=Like.all
    #    end

	   #   def create
    #    if User.find_by_id(params[:user_id])
    #     @event = Event.find(params[:event_id])
    #     @like = @event.likes.build(:user_id => params[:user_id])
    #      if @like.save 
    #       redirect_to user_events_path(current_user, @event)
    #     else
    #       render 'new'
    #     end
    #   end
    # end
    
     #     render json:
     #    	{
     #    		response_message: "liked",
     #    		response_code: "200"

     #      }
     #    else
     #      render json:
     #     	{
     #    		response_message: "not liked",
     #    		response_code: "400"
     #      }
            
     #   end
     # else
     #  render json:
     #      {
     #        response_message: "not liked",
     #        response_code: "400"
     #      }
     # end
     # end


  
      
     private
     def permitted_params
     params.require(:event).permit!
  end
end
