class AddIdApplyRecords < ActiveRecord::Migration
  def change
    add_column :apply_records, :dingdanhao, :string
  end
end
