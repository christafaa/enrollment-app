module Slugifiable

  module InstanceMethods
    def slug
      if self.respond_to?("name")
        self.name.downcase.split(" ").join("-")
      elsif self.respond_to?("subject")
        self.subject.downcase.split(" ").join("-")
      else
        self.id
      end
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find {|obj| obj.slug == slug}
    end
  end

end
