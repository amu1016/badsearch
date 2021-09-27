class CreateWants < ActiveRecord::Migration[6.0]
  def change
    create_table :wants do |t|
      t.integer :sex_id
      t.integer :level_ids
      t.integer :age_ids
      t.references :club,                null: false, foreign_key: true

      t.timestamps
    end
  end
end
