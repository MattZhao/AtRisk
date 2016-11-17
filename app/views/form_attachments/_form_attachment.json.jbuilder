json.extract! form_attachment, :id, :form_id, :file, :created_at, :updated_at
json.url form_attachment_url(form_attachment, format: :json)