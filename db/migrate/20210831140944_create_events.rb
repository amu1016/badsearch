class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :start
      t.datetime :end
      t.string :place
      t.references :club, null: false, foreign_key: true

      t.timestamps
    end
  end
end
