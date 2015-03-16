class AddImageToApplyrecord < ActiveRecord::Migration
  def change
    add_column :apply_records, :image, :string
    add_column :apply_records, :macroimage, :string
    add_column :apply_records, :mincroimage, :string
    add_column :apply_records, :QRimage, :string
  end
end
