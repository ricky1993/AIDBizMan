class RenameTheImage < ActiveRecord::Migration
  def change
    rename_column :apply_records, :mincroimage, :microimage
    rename_column :apply_records, :QRimage, :qrimage
  end
end
