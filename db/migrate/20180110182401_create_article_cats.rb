class CreateArticleCats < ActiveRecord::Migration[5.1]
  def change
    create_table :article_cats do |t|
      t.string :createdBy
      t.string :name

      t.timestamps
    end
  end
end
