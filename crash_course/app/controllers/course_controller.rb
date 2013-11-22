require 'active_support/all'
class CourseController < ApplicationController
  before_filter :authenticate_user!
  def add_one
    current_user.id
    Appointment.create(:title=>params[:title],:description=>params[:description],:start_time=>params[:start_time].to_datetime,:length=>params[:length],:price=>params[:price],:attachment_path=>params[:attachment_path],:user_id=>current_user,:topic=>params[:topic],:seats=>params[:seats])
  end

  def edit_one
  end

  def delete_one
  end

  def show_one
  end

  def show_all
  end
end
