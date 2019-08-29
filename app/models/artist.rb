require_relative "./concerns/slugifiable.rb"

class Artist < ActiveRecord::Base
    # extend Slugifiable::ClassMethods
    # include Slugifable::InstanceMethods

    has_many :songs
    has_many :song_genres, through: :songs
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