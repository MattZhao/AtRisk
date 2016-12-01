class CreateFormAttachments < ActiveRecord::Migration
  def change
    create_table :form_attachments do |t|
      t.integer :form_id
      t.string :file

      t.timestamps null: false
    end
  end
end
