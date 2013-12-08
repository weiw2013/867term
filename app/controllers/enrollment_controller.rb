class EnrollmentController < ApplicationController
  before_filter :authenticate_user!
  
  def add_one
    course = Course.find_by(id: params[:course_id])
    if get_credit?(course.price) && get_availability?(params[:start_time].to_time,params[:length].to_i) 
      
      course.seats = course.seats.to_i-1
      course.save
      Enrollment.create(:user_id=>current_user.id,:course_id =>params[:course_id])
      
      teacher = User.find_by(id:course.user_id)
      teacher.credit = teacher.credit.to_i+course.price
      teacher.save

      learner = User.find_by(id:current_user.id)
      learner.credit = learner.credit.to_i-course.price
      learner.save

      flash[:alert] = "Successfully enrolled in the course"
      
    else
      flash[:alert] = "Time conflict! Please check 'My course'"
      
    end
  end

  def get_credit?(price)
    @user = User.find_by(id:current_user.id)
    if(@user.credit >= price)
      return true
    else
      return false
    end
  end 

  def delete_one
    Enrollment.where("course_id = ? and user_id = ?",params[:course_id],current_user.id).destroy_all
    course=Course.find_by(id: params[:course_id])
    course.seats = course.seats.to_i+1
    course.save

    teacher = User.find_by(id:course.user_id)
    teacher.credit = teacher.credit.to_i-course.price
    teacher.save

    learner = User.find_by(id:current_user.id)
    learner.credit = learner.credit.to_i+course.price
    learner.save


    redirect_to :back
  end

  def show_one
  end

  def show_all
  end
end
