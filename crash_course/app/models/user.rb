class User < ActiveRecord::Base
  has_many :teach_courses, :class_name => "Course"
  has_many :enrollments
  has_many :learn_courses, :through => :enrollments, :class_name => "Course"
  has_many :comments
  #has_many :requests
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  	attr_accessor :login
  	def to_s
  		username
	end
	#attr_accessible :username, :email, :password, :password_confirmation, :remember_me
	def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end
    validates :username,:uniqueness => {:case_sensitive => false}
end
