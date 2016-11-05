class Test < ActiveRecord::Base
  has_many :test_attachments, :dependent => :destroy
  accepts_nested_attributes_for :test_attachments
end
