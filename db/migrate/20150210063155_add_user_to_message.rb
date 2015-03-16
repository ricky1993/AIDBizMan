class AddUserToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :tousername, :string
  end
end
