class Student < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  
  has_secure_password
  has_many :enrollments
  has_many :courses, through: :enrollments
end
