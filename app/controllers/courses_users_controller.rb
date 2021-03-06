class CoursesUsersController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @courses = Course.coming_up
    @enrolment = CoursesUser.new
  end

  def create
    @user = User.find(params[:user_id])

    @course = Course.find(params[:course][:id])
    @courses = Course.coming_up


    @enrolment = CoursesUser.new(user_id: @user.id, course_id: @course.id)
    respond_to do |format|
      if @enrolment.save
        format.html { redirect_to current_user, notice: 'Enrolment successful' }
        # format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render 'new' }
        # format.json { render json: @enrolment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @course_user = CoursesUser.where(user_id: params[:user_id], course_id: params[:course_id])
    @course_user.each do | enrolment |
      enrolment.destroy
    end
    
    respond_to do |format|
    format.html { redirect_to user_path(@user), notice: 'You have been removed from the course!' }      
    format.json { head :no_content }
    
  end

end

end
  
