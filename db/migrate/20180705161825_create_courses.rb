class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :subject
      t.string :day
      t.integer :teacher_id
    end
  end
end
