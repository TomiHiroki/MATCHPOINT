class CreateUserFavorites < ActiveRecord::Migration[5.0]

  def change
    create_table :post_favorites do |t|
      t.references :posts, foreign_key: true
      t.references :favorite, foreign_key: { to_table: :posts }

      t.timestamps

      t.index [:post_id, :favorite_id], unique: true
    end
  end

end
