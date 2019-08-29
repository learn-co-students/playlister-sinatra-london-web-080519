class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    
    def artists
        songs.map{|song| song.artist }.uniq
    end

    def slug
        Slugifiable.slug(self.name)
    end

    def self.find_by_slug(slug)
        self.all.select{|genre| genre.slug == slug }.first
    end
    
end#class end