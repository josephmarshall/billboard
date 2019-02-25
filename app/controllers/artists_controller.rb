class ArtistsController < ApplicationController
  before_action :get_artist, only: [:show, :edit, :update, :destroy]
  before_action :get_all_musicboards, only: [:show, :edit, :update, :destroy]
  
    def index
      @artists = Artist.all
    end
  
    def new
      @artist = Artist.new
      render "form"
    end
  
    def create
      @artist = Artist.new(artist_params)
      if @artist.save
        redirect_to artists_path
      else
        render "form"
      end
    end
  
    def edit
      render "form"
    end
  
    def update
      if @artist.update(artist_params)
        redirect_to artists_path
      else
        render :edit
      end
    end
  
    def show
    end
  
    def destroy
      @artist.destroy
      redirect_to artists_path
    end
  
    def comp
    end

    private
  
    def artist_params
      params.require(:artist).permit(:name, :genre)
    end
  
    def get_artist
      @artist = Artist.find(params[:id])
    end

    def get_all_musicboards
      @musicboards = current_user.musicboards
    end
    
  end
  