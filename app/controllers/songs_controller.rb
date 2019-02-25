class SongsController < ApplicationController
layout 'application'
before_action :get_song, only: [:show, :edit, :update, :destroy, :remove_from_billboard]
before_action :get_artist  
before_action :get_all_musicboards
#before_action Musicboardscontroller::get_all_musicboards

  def show
  end

  def new
    @song = @artist.songs.new
    render "form"
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to artist_path(@artist)
    else
      render "form"
    end
  end

  def edit
    render "form"
  end

  def update
    if @song.update(song_params) 
      redirect_to artist_path(@artist)
    else
      render "form"
    end
  end

  def destroy
    @song.destroy
    redirect_to artist_path(@artist)
  end

  private

  def get_song
    @song = Song.find(params[:id])
  end

  def get_artist
    @artist = Artist.find(params[:artist_id])
  end

  def song_params
    params.require(:song).permit(:name, :album, :artist_id, :musicboard_id)
  end

  def get_all_musicboards
    @musicboards = Musicboard.all
  end
end
