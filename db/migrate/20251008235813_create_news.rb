class CreateNews < ActiveRecord::Migration[8.0]
  def change
    create_table :news do |t|
      t.string :headline,              null: false, default: ""
      t.text :content
      t.date :published_on,              null: false
      t.text :short_description,    null:false
      t.string :tag,    null:false, default: ""
      t.string :avatar
      t.boolean :main_featured
      t.boolean :featured
      t.timestamps
    end
    add_index :news, :published_on
    add_index :news, :tag
  end
end
