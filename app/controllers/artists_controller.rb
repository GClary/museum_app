class ArtistsController < ApplicationController
  def index
    @search = params[:search]
    @artists = @search ? Artist.search(@search) : @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to artists_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])

    if @artist.update(artist_params)
      redirect_to artists_path
    else
      render 'edit'
    end
  end

  def destroy
    artist.find(params[:id]).delete
    redirect_to artists_path
  end

end
