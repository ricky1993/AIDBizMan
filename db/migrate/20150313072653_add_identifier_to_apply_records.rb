class AddIdentifierToApplyRecords < ActiveRecord::Migration
  def change
    add_column :apply_records, :idtype, :string
    add_column :apply_records, :idnumber, :string
    add_column :apply_records, :idimage, :string
    add_column :apply_records, :beianadvice,:text
    add_column :apply_records, :shenqingtime, :time
  end
end
