class ChangePaidFieldForApplyRecords < ActiveRecord::Migration
  def change
    change_column :apply_records, :paid, :string
  end
end
