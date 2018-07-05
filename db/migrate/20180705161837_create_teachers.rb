class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :alma_mater
      t.integer :years_experience
    end
  end
end
