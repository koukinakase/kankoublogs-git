class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :image1
      t.string :image2
      t.string :spot_name
      t.string :address
      t.string :content
      t.references :user, foreign_key: true
      t.references :prefecture, foreign_key: true

      t.timestamps
    end
  end
end
