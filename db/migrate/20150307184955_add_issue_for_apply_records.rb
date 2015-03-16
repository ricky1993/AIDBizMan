class AddIssueForApplyRecords < ActiveRecord::Migration
  def change
    add_column :apply_records, :isprint, :string
    add_column :apply_records, :isissue, :string
  end
end
