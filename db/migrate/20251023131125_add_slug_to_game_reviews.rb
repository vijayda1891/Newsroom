class AddSlugToGameReviews < ActiveRecord::Migration[8.0]
  def change
    add_column :game_reviews, :slug, :string
    add_index :game_reviews, :slug, unique: true
  end
end
