class Form < ActiveRecord::Base
    def self.search(search)
      where("name LIKE ?", "%#{search}%") 
    end
    def self.all_types
      %w(AtRisk Autism)
    end
end
