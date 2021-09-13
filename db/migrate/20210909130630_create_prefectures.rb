class CreatePrefectures < ActiveRecord::Migration[6.0]
  def change
    create_table :prefectures do |t|
      t.string :name, null: false

      t.timestamps
    end

    

    def up
      remove_index :prefectures, :name
      add_index :prefectures, :name, unique: true
    end

    def down
      
      remove_index :prefectures, :name
      add_index :prefectures, :name
    end

  end
end
