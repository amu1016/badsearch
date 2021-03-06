class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user
      t.references :club

      t.timestamps
      t.index [:user_id, :club_id], unique: true
    end
  end
end
