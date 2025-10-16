class ChangeColumnTypeInNews < ActiveRecord::Migration[8.0]
  def change
    change_column :news, :published_on, :datetime
  end
end
