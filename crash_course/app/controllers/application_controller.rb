require 'active_support/all'
class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def get_availability?(start_time,length)
    @user_teachings = Course.where("user_id = ?",current_user.id)     
    @user_teachings.each do |teaching|
      if(teaching.start_time <= start_time + length.minutes && teaching.start_time + teaching.length.minutes >= start_time)
        return false
      end
    end

    @user_learnings = Course.joins(:enrollments).where("courses.user_id=?",current_user.id)


    @user_learnings.each do |learning|
      if(learning.start_time <= start_time + length.minutes && learning.start_time + learning.length.minutes >= start_time)
        return false
      end
    end

    return true
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :remember_me) }
  end

  def forem_user
    current_user
  end
  helper_method :forem_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
end
