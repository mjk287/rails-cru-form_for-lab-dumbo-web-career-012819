class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def new
  end

  def create
    artist = Artist.create(artist_params)

    redirect_to(artist_path(artist))
  end

  def show
    get_artist
  end

  def edit
    get_artist
  end

  def update
    get_artist
    @artist.update(artist_params)

    redirect_to(artist_path(@artist))
  end

  private

  def get_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :bio)
  end
end
