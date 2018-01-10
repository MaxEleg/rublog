class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.date :createdAt
      t.string :text
      t.string :articleId
      t.string :createdBy

      t.timestamps
    end
  end
end
