class CreateClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :clubs do |t|
      t.string :name,                    null: false
      t.integer :status_id,              null: false
      t.integer :since_year,             null: false
      t.integer :since_month,            null: false
      t.integer :prefecture_id,          null: false
      t.integer :city_id,                null: false
      t.string :gym,                     null: false
      t.string :gender_ratio,            null: false
      t.string :beginner_ratio,          null: false
      t.string :age_range,               null: false
      t.string :purpose,                 null: false
      t.string :homepage
      t.text :information,               null: false
      t.references :user,                null: false, foreign_key: true

      t.timestamps
    end
  end
end
