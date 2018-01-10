class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :address
      t.integer :phone
      t.integer :gender
      t.integer :code
      t.date :validity_date
      t.boolean :is_author
      t.references :library, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
