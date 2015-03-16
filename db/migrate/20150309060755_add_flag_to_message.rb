class AddFlagToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :flag, :boolean
    add_column :messages, :mark, :boolean
  end
end
