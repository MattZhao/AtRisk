class SetNameAndPhoneNotNull < ActiveRecord::Migration
  def change
    change_column_null :users, :phone, false, ""
    change_column_null :users, :name, false, ""
  end
end
