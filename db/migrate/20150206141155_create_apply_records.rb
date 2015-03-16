class CreateApplyRecords < ActiveRecord::Migration
  def change
    create_table :apply_records do |t|
      t.string :personname
      t.string :personcategory
      t.string :item
      t.string :artname
      t.string :artcategory
      t.string :state
      t.string :checkopinion
      t.datetime :intime
      t.datetime :sampletime
      t.datetime :returntime
      t.datetime :outtime
      t.datetime :printtime
      t.datetime :issuetime
      t.boolean :paid
      t.timestamps null: false
    end
  end
end
