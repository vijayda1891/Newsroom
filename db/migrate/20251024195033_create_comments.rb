class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :liked
      t.integer :disliked
      t.timestamps
    end
    add_reference :comments, :commentable, polymorphic: true, null: false
    add_reference :comments, :user, null: false, foreign_key: true
  end
end
