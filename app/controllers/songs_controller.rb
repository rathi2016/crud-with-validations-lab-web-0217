class SongsController < ApplicationController
  def new
    @song = Song.new
  end
   def show
     @song = Song.find(params[:id])
   end
    def index
      @songs = Song.all
    end
   def edit
     @song = Song.find(params[:id])
   end
  def create
    @song = Song.create(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end
  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end
   def destroy
     Song.find(params[:id]).destroy
     redirect_to song_url
   end

  private
  def song_params
#
    params.require(:song).permit(:title,:released,:release_year,:genre,:artist_name)
  end

end
