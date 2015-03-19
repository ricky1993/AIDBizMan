class AddImageToArtWorks < ActiveRecord::Migration
  def change
    add_column :art_works, :macroimage, :string
    add_column :art_works, :microimage_a, :string
    add_column :art_works, :microimage_b, :string
    add_column :art_works, :microimage_c, :string
    add_column :art_works, :microimage_d, :string
    add_column :art_works, :QRimage, :string
  end
end
