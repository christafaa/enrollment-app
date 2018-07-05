class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :username
      t.string :alma_mater
      t.integer :years_experience
      t.string :password_digest
    end
  end
end
