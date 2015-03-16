class AddNewFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :phonenumber, :string
    add_column :users, :job, :string
  end
end
