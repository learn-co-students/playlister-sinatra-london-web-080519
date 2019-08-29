# require 'sinatra/flash'
# 
class SongsController < ApplicationController
    # enable :sessions

    get '/songs' do
        @songs = Song.all
        
        erb :"songs/index"
        
    end

    get '/songs/new' do
        @artists = Artist.all
        @genres = Genre.all

        erb :"/songs/new"
    
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        last_updated_song = Song.order(:updated_at).last
        if @song == last_updated_song
            @isupdated = true
        else
            @isupdated = false
        end
        if Song.last == @song
            @isnew = true
        else
            @isnew = false
        end
        erb :"songs/show"
    end

    post '/songs' do
        @song = Song.create(params[:song])
        # binding.pry
        if !params['artist']['name'].empty? 
            artist = Artist.find_or_create_by(name: params[:artist][:name])
            @song.artist = artist
            @song.save
        end
        redirect "/songs/#{@song.slug}"
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @artists = Artist.all
        @genres = Genre.all
        erb :"songs/edit"
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song])
        if !params[:artist][:name].empty?
            @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
            @song.save
        end
        redirect "/songs/#{@song.slug}"
    end
end
