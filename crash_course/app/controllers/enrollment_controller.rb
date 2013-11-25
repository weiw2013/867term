class EnrollmentController < ApplicationController
  before_filter :authenticate_user!
  
  def add_one
    if get_availability?(params[:start_time].to_time,params[:length].to_i)
      course = Course.find_by(id: params[:course_id])
      course.seats = course.seats.to_i-1
      course.save
      Enrollment.create(:user_id=>current_user.id,:course_id =>params[:course_id])
      render :json => {"response" => "Enrollment added successfully" }
    else
      render :json => {"response" => "Time conflict! Please check 'My course' " }
    end
  end 

  def delete_one
  end

  def show_one
  end

  def show_all
  end
end
