module Slugifiable
    module InstanceMethods
        def slug
            name = self.name.downcase.strip.gsub(" ", "-").gsub("[^\w-]","")
        end
    end

    module ClassMethods
        def find_by_slug(slug)
            self.all.detect do |item|
                item.slug == slug
            end
        end
    end
end