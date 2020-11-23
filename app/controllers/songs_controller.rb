class SongsController < ApplicationController

    def index
        @songs = Song.all 
        render :index 
    end

    def show
        @song = Song.find(params[:id])
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(song_params)
        if @song.valid?
            redirect_to song_path(@song)
        else
            flash[:my_errors] = @song.errors.full_messages 
            redirect_to new_song_path 
        end
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.fnd(params[:id])
        @song.update(song_params)
        if @song.valid?
            redirect_to song_path(@song)
        else
            flash[:my_errors] = @song.errors.full_messages 
            redirect_to edit_song_path 
        end

    
    def destroy
        @song = Song.fnd(params[:id])
        @song.destroy 
        redirect_to songs_path 
    end

    end


    private

    def song_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end

end
