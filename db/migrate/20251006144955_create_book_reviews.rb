class CreateBookReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :book_reviews do |t|
      t.string :title,              null: false, default: ""
      t.float :rating,              null: false, default: 0.0
      t.text :review              
      t.date :published,              null: false
      t.string :author,    null:false, default: ""
      t.string :avatar
      t.string :genre,    null:false, default: ""
      t.timestamps
    end
  end
end
