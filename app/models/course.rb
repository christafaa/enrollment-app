class Course < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  belongs_to :teacher
  has_many :enrollments
  has_many :students, through: :enrollments
end
