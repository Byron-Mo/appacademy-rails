class AlbumsController < ApplicationController
  before_action :require_user!

  def new
    @album = Album.new
    # @bands = Band.all
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      # redirect_to new_album_url
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    @bands = Band.all
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      # redirect_to edit_album_url
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    # @band = Band.where(id: @album.band_id)
    @album.delete
    redirect_to band_url(@album.band_id)
  end

  def show
    @album = Album.find(params[:id])
    @band = Band.find(@album.band_id)
    @tracks = Track.where(album_id: @album.id)
  end

  private
  def album_params
    params.require(:album).permit(:recordd, :album_type, :band_id)
  end
end
