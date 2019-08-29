require_relative "./concerns/slugifiable.rb"
class Artist < ActiveRecord::Base
    has_many :songs
    
    def genres
        songs.map{|song| song.genres }.flatten.uniq
    end

    def slug
        Slugifiable.slug(self.name)
    end

    def self.find_by_slug(slug)
        self.all.select{|artist| artist.slug == slug }.first
    end
  
end#class end