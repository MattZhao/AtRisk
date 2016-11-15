class Form < ActiveRecord::Base
  def self.search(search)
    where("name LIKE ?", "%#{search}%") 
  end
  def self.all_types
    %w(AtRisk Autism)
  end
  def self.all_active
      %w(Active Inactive)
  end
  #check that terms of service were accepted
  validates :terms_of_service, :acceptance => true
end
