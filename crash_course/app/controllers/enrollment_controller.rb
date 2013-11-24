class EnrollmentController < ApplicationController
  before_filter :authenticate_user!
  
  def add_one
  	Enrollment.create(:user_id=>current_user.id,:course_id =>params[:course_id])
    redirect_to :back
  end

  def delete_one
  end

  def show_one
  end

  def show_all
  end
end
