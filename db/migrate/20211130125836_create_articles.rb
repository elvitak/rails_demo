class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content

      t.timestamps
    create_column :articles, :body, :text
    end
  end
end
