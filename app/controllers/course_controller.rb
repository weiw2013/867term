require 'active_support/all'
class CourseController < ApplicationController
  before_filter :authenticate_user!, :only => [:new,:create,:add,:add_one,:show_user_course]
  def new
    @course = Course.new
  end
  
  def create
    course_start_time = DateTime.civil_from_format(:local,params[:course]["start_time(1i)"].to_i ,params[:course]["start_time(2i)"].to_i,params[:course]["start_time(3i)"].to_i,params[:course]["start_time(4i)"].to_i,params[:course]["start_time(5i)"].to_i).to_time
    
    if get_availability?(course_start_time,params[:course][:length].to_i)      
      @course = Course.new (course_params)
      @course.user_id = current_user.id
      @course.save
      flash[:alert] = "Successfully created course."+course_start_time.to_s+" "+params[:course][:length]
      redirect_to({ :controller => :course, :action => :show_user_course }, :alert => "Successfully created course.")
    else
      flash[:alert] = "Time conflict! Please check 'My course'"
      redirect_to({ :controller => :course, :action => :show_user_course }, :alert => "Time conflict! Please double check")
    end
    
  end
  
  def add_one
    #if get_availability?(params[:start_time].to_time,params[:length].to_i)
      #Course.create(:title=>params[:title],:description=>params[:description],:length=>params[:length],:price=>params[:price],:attachment_path=>params[:attachment_path],:topic=>params[:topic],:seats=>params[:seats],:user_id=>current_user.id,:start_time=>params[:start_time].to_time)
      #render :json => {"response" => "Course added successfully" }
      @course = Course.new (course_params)
      @course.save
    #else
      #render :json => {"response" => "Time conflict! Please check 'My course' " }
    #end
    
  end

  def edit_one
  end

  def delete_one
    Course.destroy(params[:id])
    redirect_to :back
  end

  def show_user_course
    @user_teachings = Course.where("user_id = ?",current_user.id)
    @enrollments = {}

    @user_teachings.each do |teaching|
      @enrollments[teaching.id] = User.joins(:enrollments).where("enrollments.course_id=?",teaching.id)
    end
    @user_learnings = Course.joins(:enrollments).where("enrollments.user_id=?",current_user.id)
  end

  def show_one
    @course = Course.find(params[:id])
    @user = User.find(@course.user_id)
    @comments = Comment.where("course_id = ?", params[:id])
  end

  def browse
    @course = Course.where("start_time >= ? AND seats > 0", DateTime.now).all    
  end

  def show_all
    @courses = Course.where("start_time >= ? AND seats > 0", DateTime.now).all(:order=>params["Sort by"])
    #respond_to do |format|
    #  format.js { render :json => @course.to_json(:only => [:title, :id,:start_time])}
    #end
  end

  def search
    @search_results = Course.where("start_time >= ? AND seats > 0 And (title like ? or description like ?)", DateTime.now,"%#{params[:search]}%","%#{params[:search]}%").all(:order=>params["Sort by"])
  end

  private
  def course_params
    params.require(:course).permit(:title, :topic, :length,:start_time,:description, :seats, :price,:attachment)
  end




 
end
