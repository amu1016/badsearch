class CreateWantLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :want_levels do |t|
      t.references :want, foreign_key: true
      t.references :level, foreign_key: true

      t.timestamps
    end
  end
end
