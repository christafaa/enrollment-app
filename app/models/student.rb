class Student < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  validates :name, :username, :password_digest, presence: true
  validates :username, uniqueness: true
  has_secure_password
  has_many :enrollments
  has_many :courses, through: :enrollments
end
