class Course < ActiveRecord::Base
	belongs_to :teacher, :class_name => "User"
	has_many :enrollments
	has_many :learners, :through=> :enrollments, :class_name => "User"
	has_many :comments
end
