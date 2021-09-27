class CreateWants < ActiveRecord::Migration[6.0]
  def change
    create_table :wants do |t|
      t.integer :sex_id,                 null: false
      t.integer :level_ids,              null: false
      t.integer :age_ids,                null: false
      t.references :club,                null: false, foreign_key: true

      t.timestamps
    end
  end
end
