class AddCourseReferecneToCourseCategory < ActiveRecord::Migration
  def change
    add_reference :course_categories, :course
  end
end
