class CoursesController < ApplicationController
  load_and_authorize_resource
  def index
    @courses = Course.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  def show
    @course = Course.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  def new
    @course = Course.new
    @intructor = CoursesInstructor.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(params[:course])
    @course.start = Date.strptime(params['start_date'], "%Y-%m-%d")
    @course.endtime = Date.strptime(params['end_date'], "%Y-%m-%d")
    if @course.save
      redirect_to @course, notice: 'Course was successfully created.'
    else
     render action: "new"
    end
  end

  def update
    @course = Course.find(params[:id])
    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end


end

