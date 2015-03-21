class AddQrimageToArtWorks < ActiveRecord::Migration
  def change
    add_column :art_works, :myimage, :string
  end
end
