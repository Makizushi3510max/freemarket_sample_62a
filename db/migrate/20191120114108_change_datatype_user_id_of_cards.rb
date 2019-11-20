class ChangeDatatypeUserIdOfCards < ActiveRecord::Migration[5.2]
  def change
    change_column :cards, :user_id, :references, null: false, foreign_key: true
  end
end
