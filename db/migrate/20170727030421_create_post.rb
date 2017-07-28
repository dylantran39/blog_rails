class CreatePost < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :user, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
