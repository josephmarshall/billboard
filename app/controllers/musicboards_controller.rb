class MusicboardsController < ApplicationController
  before_action :get_musicboard, only: [:show, :edit, :update, :destroy]

  def index
    @musicboards = Musicboard.all
  end

  def new
    @musicboard = Musicboard.new
    render "form"
  end

  def create
    @musicboard = Musicboard.new(musicboard_params)
    if @musicboard.save
      redirect_to musicboards_path
    else
      render "form"
    end
  end

  def edit
    render "form"
  end

  def update
    if @musicboard.update(musicboard_params)
      redirect_to musicboards_path
    else
      render :edit
    end
  end

  def show
    @songs = Song.where(musicboard_id: @musicboard.id)
  end

  def destroy
    @musicboard.destroy
    redirect_to musicboards_path
  end

  private

  def musicboard_params
    params.require(:musicboard).permit(:name)
  end

  def get_musicboard
    @musicboard = Musicboard.find(params[:id])
  end
end
