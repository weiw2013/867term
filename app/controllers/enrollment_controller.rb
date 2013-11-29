class EnrollmentController < ApplicationController
  before_filter :authenticate_user!
  
  def add_one
    if get_credit? && get_availability?(params[:start_time].to_time,params[:length].to_i) 
      course = Course.find_by(id: params[:course_id])
      course.seats = course.seats.to_i-1
      course.save
      Enrollment.create(:user_id=>current_user.id,:course_id =>params[:course_id])
      
      teacher = User.joins(:courses).where("user_id=?",current_user.id)
      teacher.credit = teacher.credit.to_i+1
      teacher.save

      learner = User.joins(:enrollments).where("user_id=? and course_id=?",current_user.id,params[:course_id])
      learner.credit = learner.credit.to_i-1
      learner.save
      
      render :json => {"response" => "Enrollment added successfully" }
    else
      render :json => {"response" => "Time conflict! Please check 'My course' " }
    end
  end

  def get_credit?
    @user = User.find_by(id:current_user.id)
    if(@user.credit > 0)
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
    redirect_to :back
  end

  def show_one
  end

  def show_all
  end
end
