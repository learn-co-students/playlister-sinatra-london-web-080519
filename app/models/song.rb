require_relative "./concerns/slugifiable.rb"

class Song < ActiveRecord::Base
    # extend Slugifiable::ClassMethods
    # include Slugifiable::InstanceMethods

    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        name = self.name.downcase.strip.gsub(" ", "-").gsub("[^\w-]","")
    end

    def self.find_by_slug(slug)
        self.all.detect do |item|
            item.slug == slug
        end
    end
end