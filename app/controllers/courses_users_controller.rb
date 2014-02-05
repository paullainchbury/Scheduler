class CoursesUsersController < ApplicationController

def new
  @user = User.find(params[:user_id])
  @courses = Course.coming_up
end

def create
    user_type = params[:usertype] || 'student'
    @user = User.find(params[:user_id])
    @course = Course.find(params[:course][:course_id])

    existing_enrolment = CoursesUser.where(user_id: @user.id, course_id: @course.id)

    if !existing_enrolment.blank?
      redirect_to user_path(@user), notice: 'You\'re already enrolled on this course!'
      return
    end

    @enrolment = CoursesUser.new(user_id: @user.id, course_id: @course.id, user_type: user_type)

      respond_to do |format|
        if @enrolment.save
          format.html { redirect_to user_path(@user), notice: 'Enrolment successful' }
          # format.json { render json: @user, status: :created, location: @user }
        else
          format.html { redirect_to user_path(@user), notice: 'Enrolment NOT successful' }
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
  
