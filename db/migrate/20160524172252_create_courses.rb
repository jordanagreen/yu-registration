class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :department
      t.string :number
      t.string :title

      t.timestamps null: false
    end
  end
end
