require 'active_support/all'
class CourseController < ApplicationController
  before_filter :authenticate_user!
  def add_one

    Course.create(:title=>params[:title],:description=>params[:description],:length=>params[:length],:price=>params[:price],:attachment_path=>params[:attachment_path],:topic=>params[:topic],:seats=>params[:seats],:user_id=>current_user.id,:start_time=>params[:start_time].to_datetime)
  end

  def edit_one
  end

  def delete_one
  end

  def show_one
    @course = Course.find(params[:id]);
    @user = User.find(@course.user_id);
    #respond_to do |format|
    #  format.js { render :json => @course.to_json()}
    #end
  end

  def show_all
    @course = Course.where("start_time >= ?", DateTime.now).all
    
    respond_to do |format|
      format.js { render :json => @course.to_json(:only => [:title, :id,:start_time])}
    end
  end
end
