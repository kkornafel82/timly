class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :trade
      t.text :address
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
