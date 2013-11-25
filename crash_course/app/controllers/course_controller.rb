require 'active_support/all'
class CourseController < ApplicationController
  before_filter :authenticate_user!, :only => [:add,:add_one,:show_user_course]
  def add_one
    if get_availability?(params[:start_time].to_time,params[:length].to_i)
      Course.create(:title=>params[:title],:description=>params[:description],:length=>params[:length],:price=>params[:price],:attachment_path=>params[:attachment_path],:topic=>params[:topic],:seats=>params[:seats],:user_id=>current_user.id,:start_time=>params[:start_time].to_time)
      render :json => {"response" => "Course added successfully" }
    else
      render :json => {"response" => "Time conflict! Please check 'My course' " }
    end
    
  end

  def edit_one
  end

  def delete_one
  end

  def show_user_course
    @user_teachings = Course.where("user_id = ?",current_user.id) 
  end

  def show_one
    @course = Course.find(params[:id]);
    @user = User.find(@course.user_id);
  end

  def show_all
    @course = Course.where("start_time >= ? AND seats > 0", DateTime.now).all
    
    respond_to do |format|
      format.js { render :json => @course.to_json(:only => [:title, :id,:start_time])}
    end
  end

 
end
