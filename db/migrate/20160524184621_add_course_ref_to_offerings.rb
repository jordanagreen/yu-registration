class AddCourseRefToOfferings < ActiveRecord::Migration
  def change
    add_reference :offerings, :course, index: true, foreign_key: true
  end
end
