class ChangePhoneNumbers < ActiveRecord::Migration
  def change
    change_column :forms, :phone_number, :string
    change_column :forms, :ec1_phone_home, :string
    change_column :forms, :ec1_phone_work, :string
    change_column :forms, :ec1_phone_cell, :string
    change_column :forms, :ec2_phone_home, :string
    change_column :forms, :ec2_phone_work, :string
    change_column :forms, :ec2_phone_cell, :string
  end
end
