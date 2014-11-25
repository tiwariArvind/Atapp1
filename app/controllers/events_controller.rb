class EventsController < ApplicationController
	protect_from_forgery with: :null_session

      def  new
        @event=Event.new
      end

      def index
        @user=User.find(params[:user_id])
      
      end

      def show
        @event=Event.find(params[:id])
      
      end

	       def create 
          params[:event][:user_ids].delete("")
          @user =User.find_by_id(params[:event][:user_id])
          #logger.info "============#{params[:event][:user_id].inspect}============"
		      @users=User.find(params[:event][:user_ids])
          @event=current_user.events.create(permitted_params)
          respond_to do |format|
         if @event.save
          format.html { redirect_to  user_event_path(current_user,@event), notice: 'event was successfully created.' }
          format.json { render json: @event }
       else
         format.html { render :new }
         format.json { render json: @event.errors }
      end
      end
      end

      def edit
       @event=Event.find(params[:id])
      end

        def update

          @event = Event.find(params[:id])
          if @event.update(permitted_params)
         redirect_to user_events_path(current_user,@event)
         else
           render 'edit'
         end
       end

      def destroy
      @event = Event.find(params[:id])
      @event.destroy
      redirect_to user_events_path(current_user,@event)
     end


        #   if @event.save
        #   @event.users << @users
        #   #redirect_to  user_event_path(@user,@event)
        #     render json:
        # 	   {
        # 		 response_code: "200",
        # 		 response_message: "events create sucessfully",
        # 		 events_id: @event.id
        # 	   }

        #  else

        #   #render 'new'
       	#      render json:
        #      {
        #      response_code: "400",
       	#    	 response_message: "events not created"
       	#      }
        #   end
        # end

     #    def like
     #      @event = Event.find(params[:event])
     #      @like = @event.likes.build(:user_id => params[:user_id])
     #     if @like.save
     #     redirect_to user_events_path(current_user, @event)
     #     else
     #     render 'new'
     #   end
     # end
        

      private
      def permitted_params
      params.require(:event).permit(:name, :discription)
     end
   end


