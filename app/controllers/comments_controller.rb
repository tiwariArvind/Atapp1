class CommentsController < ApplicationController
   protect_from_forgery with: :null_session
   before_filter :current_user, :only => [:destroy]

    def new
    	 @event=Event.find_by_id(params[:event_id])
       @comment =@event.comments.new
    end

    
     def index
      @event=Event.find(params[:event_id])
      @comments=@event.comments
     end


      def show
      @event= Event.find_by_id(params[:event_id])
      @comment=@event.comments.find_by_id(params[:id])
      end


        def create
        @event=Event.find(params[:event_id])
        @comment=Comment.find_by_id(params[:id])
        @comment=@event.comments.create(permitted_params)
       if @comment.save
          redirect_to user_event_comment_path(current_user,@event,@comment)
      else
          render 'new'
    end
  end


        def destroy
        Rails.logger.info"++++++++++++++++++++++#{params.inspect}"
        @event = Event.find_by_id(params[:event_id])
        @comment =Comment.find_by_id(params[:id])
        @comment.destroy
        redirect_to root_url
       end

      # def destroy
      # Rails.logger.info"++++++++++++++==#{params.inspect}"
      # @event= Event.find_by_id(params[:event_id])

      # @comment=Comment.find_by_id(params[:id])

      # @comment=@event.comments.find_by_id(params[:comment_id])
        
      # @comment.destroy
      # flash[:notice]= 'Your comment is deleted..'
      # redirect_to user_event_comments_path(current_user,@event)
      # end

      # def destroy
      #  @comment = Comment.find(params[:id]) 
      #   if @comment.destroy
      #     respond_to do |format|
      #       format.html { redirect_to user_event_comments_path(current_user,@event), notice: "Comment deleted."  }
      #     end
      #   end
      # end



      private

     def permitted_params
     params.require(:comment).permit!
   end
 end
 