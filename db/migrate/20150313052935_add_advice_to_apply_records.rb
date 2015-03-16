class AddAdviceToApplyRecords < ActiveRecord::Migration
  def change
    add_column :apply_records, :advice, :text
  end
end
