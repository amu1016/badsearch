class CreateWantAges < ActiveRecord::Migration[6.0]
  def change
    create_table :want_ages do |t|
      t.references :want, foreign_key: true
      t.references :age

      t.timestamps
    end
  end
end
