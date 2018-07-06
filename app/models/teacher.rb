class Teacher < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  
  has_secure_password
  has_many :courses
end
