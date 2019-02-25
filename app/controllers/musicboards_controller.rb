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

  def generate_test_data
    Song.delete_all
    Artist.delete_all
    Musicboard.delete_all
    
    Musicboard.create(id: 1, name: "100 Greatest Hits")
    Musicboard.create(id: 2, name: "80's Killer Classics")
    Musicboard.create(id: 3, name: "My Favorite Songs")
    Musicboard.create(id: 4, name: "Ultimate Rock & Roll")
    
    for x in 1..20 do 
      Artist.create({id: x, name: Faker::Name.name, genre: Faker::Commerce.material}) 
    end

    for s in 1..500 do 
        if rand > 0.95
        board = [1,2,3,4].sample
        else
        board = nil
        end
      Song.create(name: Faker::BossaNova.song, album: Faker::Company.bs, artist_id: rand(1..20), musicboard_id: board) 
      end
    redirect_to musicboards_path
  end



  def delete_all_data
    Song.delete_all
    Artist.delete_all
    Musicboard.delete_all
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
