class CreateItemsTags < ActiveRecord::Migration
  def change
    create_table :items_tags, :id => false do |t|
      t.references :item, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
    end
  end
end
