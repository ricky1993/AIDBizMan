class CreateArtWorks < ActiveRecord::Migration
  def change
    create_table :art_works do |t|
      t.string :name
      t.date :date
      t.string :place
      t.string :author
      t.string :image
      t.text :describe
      t.references  :apply_record,index: true

      t.timestamps null: false
      add_foreign_key :art_works, :apply_record
    end
  end
end
