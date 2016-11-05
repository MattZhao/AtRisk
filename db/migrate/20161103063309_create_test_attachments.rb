class CreateTestAttachments < ActiveRecord::Migration
  def change
    create_table :test_attachments do |t|
      t.string :attachment

      t.timestamps null: false
    end
  end
end
