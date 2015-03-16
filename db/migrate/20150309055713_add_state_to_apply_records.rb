class AddStateToApplyRecords < ActiveRecord::Migration
  def change
    add_column :apply_records, :state1, :string
  end
end
