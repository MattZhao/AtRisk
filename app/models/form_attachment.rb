class FormAttachment < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  belongs_to :form
end
