class AddPersonToApplyRecords < ActiveRecord::Migration
  def change
    add_column :apply_records, :itemsave, :string
    add_column :apply_records, :sample, :string
    add_column :apply_records, :issue, :string
  end
end
