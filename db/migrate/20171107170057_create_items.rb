class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      
      t.string :name
      t.string :price
      t.string :brand
      t.string :category
      t.date :dueDate
      t.string :url
      t.text :content
      t.string :image
      t.integer :item_id
    
      t.timestamps null: false
    end
  end
end
