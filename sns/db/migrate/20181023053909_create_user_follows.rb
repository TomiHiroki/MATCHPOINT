class CreateUserFollows < ActiveRecord::Migration[5.0]

  def change
    create_table :user_follows do |t|
      t.references :users, foreign_key: true
      t.references :follow, foreign_key: { to_table: :users }

      t.timestamps

      t.index [:user_id, :follow_id], unique: true
    end
  end


end
