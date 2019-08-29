require 'pry'

class SongsController < ApplicationController


    #index
    get '/songs' do
        erb :"songs/songs"
    end
    
    #new
    get '/songs/new' do
        erb :"songs/new"
    end

    #show
    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        # binding.pry
        erb :"songs/show_song"
    end

    #create
    post '/songs' do 
        if artist = Artist.all.find{|artist| artist.name == params[:artist][:name]}
            artist
        else
            artist = Artist.new(name: params[:artist][:name])
        end

        genre_ids = params[:genres].map{|genre_id| genre_id.to_i}
        # binding.pry
        genres = genre_ids.map {|genre_id| Genre.all.find(genre_id)}

        @song = Song.create(name: params[:song][:name],
        artist: artist,
        genres: genres)

        #@newly_created = true

        redirect "/songs/#{@song.slug}"
    end

    #edit
    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        erb :"songs/edit_song"
    end


    #update
    patch '/songs/:slug' do
        if artist = Artist.all.find{|artist| artist.name == params[:artist][:name]}
            artist
        else
            artist = Artist.new(name: params[:artist][:name])
        end

        genre_ids = params[:genres].map{|genre_id| genre_id.to_i}
        # binding.pry
        genres = genre_ids.map {|genre_id| Genre.all.find(genre_id)}

        @song = Song.all.find_by_slug(params[:slug])
        
        @song.update(name: params[:song][:name],
        artist: artist,
        genres: genres)
        # binding.pry

        #@newly_created = true

        redirect "/songs/#{@song.slug}"
    end

end
