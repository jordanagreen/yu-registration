class ChangeColumnNames < ActiveRecord::Migration
  def change
    rename_column :courses, :number, :course_number
    rename_column :offerings, :time, :section
    rename_column :offerings, :instructor, :professor_last_name
    rename_column :offerings, :limit, :spots_available
  end
end
