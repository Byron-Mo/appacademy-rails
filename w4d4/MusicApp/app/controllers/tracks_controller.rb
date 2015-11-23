class TracksController < ApplicationController
  before_action :require_user!

  def new
    @track = Track.new
    # @albums = Album.all
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      # redirect_to new_track_url
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    @albums = Album.all
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      # redirect_to edit_track_url
      render :edit
    end
  end

  def show
    @track = Track.find(params[:id])
    @album = Album.find(@track.album_id)
    @notes = Note.where(track_id: @track.id)
  end

  def destroy
    @track = Track.find(params[:id])
    @track.delete
    redirect_to album_url(@track.album_id)
  end

  private
  def track_params
    params.require(:track).permit(:song, :track_type, :album_id, :lyrics)
  end
end
