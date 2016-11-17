class Form < ActiveRecord::Base
  has_many :form_attachments, :dependent => :destroy
  accepts_nested_attributes_for :form_attachments
  
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
