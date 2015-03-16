class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :username, :string
    add_column :users, :usercategory, :string
  end
end
