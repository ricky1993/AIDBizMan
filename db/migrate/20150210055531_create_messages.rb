class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.text :content
      t.references :user, index: true
      t.integer :touser

      t.timestamps null: false
    end
    add_foreign_key :messages, :users
  end
end
