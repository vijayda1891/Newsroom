class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :title,              null: false, default: ""
      t.text :content
      t.date :published,              null: false
      t.text :short_description,    null:false
      t.string :tag,    null:false, default: ""
      t.string :avatar
      t.string :author,    null:false, default: ""
      t.timestamps
    end
    add_index :articles, :title,                unique: true
    add_index :articles, :tag
  end
end
