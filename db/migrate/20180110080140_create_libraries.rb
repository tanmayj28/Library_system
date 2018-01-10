class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :address
      t.integer :phone

      t.timestamps null: false
    end
  end
end
