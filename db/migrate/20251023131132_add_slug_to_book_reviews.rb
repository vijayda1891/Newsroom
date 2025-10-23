class AddSlugToBookReviews < ActiveRecord::Migration[8.0]
  def change
    add_column :book_reviews, :slug, :string
    add_index :book_reviews, :slug, unique: true
  end
end
