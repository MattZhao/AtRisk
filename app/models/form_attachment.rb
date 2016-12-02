class FormAttachment < ActiveRecord::Base
  mount_uploader :file, AttachmentUploader
  belongs_to :form
end
