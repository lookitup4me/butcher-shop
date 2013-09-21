class AddFavoriteIdToCuts < ActiveRecord::Migration
  def change
    add_column :cuts, :favorite_id, :integer
  end
end
