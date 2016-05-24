class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.integer :semester
      t.string :location
      t.integer :time
      t.string :instructor
      t.integer :limit
      t.integer :crn

      t.timestamps null: false
    end
  end
end
