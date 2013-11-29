class Course < ActiveRecord::Base
	TOPICS = ['Art','Science','Personal development','Home improvement','Others']
	belongs_to :teacher, :class_name => "User"
	has_many :enrollments, dependent: :destroy
	has_many :learners, :through=> :enrollments, :class_name => "User"
	has_many :comments, dependent: :destroy
	#attr_accessible :title, :topic, :length,:start_time,:description, :seats, :price,:attachment
	mount_uploader :attachment, AttachmentUploader
end
