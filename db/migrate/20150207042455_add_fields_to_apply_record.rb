class AddFieldsToApplyRecord < ActiveRecord::Migration
  def change
    add_column :apply_records, :user, :string
  end
end
