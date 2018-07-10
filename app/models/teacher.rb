class Teacher < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  validates :username, uniqueness: true
  has_secure_password
  has_many :courses
end
