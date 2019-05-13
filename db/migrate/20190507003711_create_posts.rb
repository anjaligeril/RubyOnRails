class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :user_id
      t.string :title
      t.text :description
      t.string :image
      t.string :category

      t.timestamps
    end
  end
end
