class Slugifiable
    
    def self.slug(text)
        text.downcase.gsub(' ', '-').gsub('&', '%26').gsub("'", "%60").gsub("$", "%24").gsub("+", "%2B").gsub(",", "%2C")
    end

    def self.deslug(slug)
        slug.gsub('-', ' ').upcase
    end


end