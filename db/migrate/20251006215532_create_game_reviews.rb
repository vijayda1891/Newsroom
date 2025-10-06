class CreateGameReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :game_reviews do |t|
      t.string :title,              null: false, default: ""
      t.integer :rating,              null: false, default: 0
      t.text :review
      t.date :release,              null: false
      t.text :short_description
      t.string :avatar
      t.timestamps
    end
    add_index :game_reviews, :title,                unique: true
  end
end
