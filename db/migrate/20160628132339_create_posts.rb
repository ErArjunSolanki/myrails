class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :meta_title
      t.text :meta_desc
      t.string :slug
      t.boolean :publish

      t.timestamps null: false
    end
  end
end
