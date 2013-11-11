class Course < ActiveRecord::Base
	belongs_to :teacher, :class_name => "User"
	has_many :learnings
	has_many :learners, :through=> :learnings, :class_name => "User"
	has_many :course_attachements
	has_many :comments
end
