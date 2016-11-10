class AddTestIdToTestAttachment < ActiveRecord::Migration
  def change
    add_column :test_attachments, :test_id, :integer
  end
end
