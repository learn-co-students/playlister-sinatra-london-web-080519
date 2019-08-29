require "pry"
class SongsController < ApplicationController

    get '/songs' do
        # This should present the user with a list of all songs in the library.
        # Each song should be a clickable link to that particular song's show page.
        @songs = Song.all
        erb :'songs/index'
    end
    
    get '/songs/new' do
        @genres = Genre.all
        erb :'/songs/new'
    end

    get '/songs/:slug' do
        # Any given song's show page should have links to that song's artist and the each genre 
        # associated with the song.
        # Pay attention to the order of /songs/new and /songs/:slug. The route /songs/new could 
        # interpret new as a slug if that controller action isn't defined first.
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end
    
    post '/songs' do
        song = Song.create(params[:song])

        artist = Artist.find_or_create_by(params["artist"])
        song.artist_id = artist.id
        song.save

        if !params["genre"]["name"].empty?
            song.genres << genre = Genre.create(name: params["genre"]["name"])
        else
            song.genres << genre = Genre.find(params[:genres])
        end

        song.genres.each do |genre|
            song_genre = SongGenre.create(genre_id: genre.id, song_id: song.id)
        end

        redirect "/songs/#{song.slug}"
    end
    
    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        erb :'songs/edit'
    end

    patch '/songs/:slug' do
        song = Song.find_by_slug(params[:slug])
        artist = Artist.find_or_create_by(params[:artist])
        song.artist_id = artist.id
        song.save
        redirect "/songs/#{song.slug}"
    end
    
end