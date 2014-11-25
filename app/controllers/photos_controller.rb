class PhotosController < ApplicationController
  before_filter :current_user, :only => [:destroy]

	
     def new
    	 @album=Album.find(params[:album_id])
    	 @photo=Photo.new
      end

      def index
    	@album= Album.find(params[:album_id])
    	@photos=@album.photos
      end

       def show
       Rails.logger.info"+++++++++++++++++==#{params.inspect}"
       @album= Album.find(params[:album_id])
       @photo=Photo.find_by_id(params[:id])
       end

	    def create
		  @user=User.find_by_id(params[:user_id])
	    @album=Album.find_by_id(params[:album_id])
	    @photo = @album.photos.build(permitted_params) 
		   if @photo.save
        redirect_to user_album_photo_path(current_user,@album,@photo)
        else
        render :new  
       end
      end

      def edit
        @album=Album.find_by_id(params[:id])
        @photo=Photo.find_by_id(params[:id])
      end

      def update
      @album=Album.find(params[:album_id])
      @photo = Photo.find(params[:id])
      if @photo.update(permitted_params)
       redirect_to user_album_photo_path(current_user,@album,@photo)
      else
      render 'edit'
    end
   end


        def destroy
          Rails.logger.info"++++++++++++++++++++++#{params.inspect}"
        @album = Album.find_by_id(params[:album_id])
        @photo =Photo.find_by_id(params[:id])
        @photo.destroy
        redirect_to user_album_photos_path(current_user,@album)
       end
 

			 
       private
       def permitted_params
       params.require(:photo).permit!#(:)
    end
  end

