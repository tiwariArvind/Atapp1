class AlbumsController < ApplicationController

	def new
    @album=Album.new
	end

	def show
  @album=Album.find_by_id(params[:id])
	end

	def index
  @albums=current_user.albums
	end

	def create
  @album=current_user.albums.create(album_params)
	if @album.save
	# redirect_to user_album_path(current_user,@album)
	# else
	# 	render 'new'
	# end
 #  end

	if params[:images]
        params[:images].each { |image|
          @album.photos.create(image: image)
        }
      end
      flash[:notice] = "Your album has been created."
      redirect_to user_album_path(current_user,@album)
    else 
      flash[:alert] = "Something went wrong."
      render :new
    end
end

    def destroy
      @album = Album.find_by_id(params[:id])
      @album.destroy
      redirect_to user_albums_path(current_user,@album)
   end



  private
   def album_params
   	params.require(:album).permit!#()
   end
end
