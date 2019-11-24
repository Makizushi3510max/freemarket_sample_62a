class RenameUserIdColumnToCards < ActiveRecord::Migration[5.2]
  def change
    rename_column :cards, :user_id_id, :user_id
  end
end
