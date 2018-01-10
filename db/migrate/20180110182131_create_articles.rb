class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.date :createdAt
      t.string :title
      t.string :text
      t.string :createdBy
      t.string :categories
      t.integer :views

      t.timestamps
    end
  end
end
