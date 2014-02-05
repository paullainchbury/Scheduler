class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
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

    start1 = DateTime.new(params[:course]["start(1i)"].to_i, params[:course]["start(2i)"].to_i, params[:course]["start(3i)"].to_i)

    end1 = DateTime.new(params[:course]["endtime(1i)"].to_i, params[:course]["endtime(2i)"].to_i, params[:course]["endtime(3i)"].to_i)

    date_range = (start1.to_i..end1.to_i).step(1.day)
    
    date_range.each do |date_as_i|

      date = Time.at(date_as_i).to_datetime
      start_timeh = nil
      weekday = date.wday

      if weekday == 1 && !(params[:course]["Mondaystart"].blank?)
        start_timeh = params[:course]["Mondaystart"].to_i
        start_timem = params[:course]["Mondaystartm"].to_i
        end_timeh = params[:course]["Mondayend"].to_i
        end_timem = params[:course]["Mondayendm"].to_i
      end

      if weekday == 2 && !(params[:course]["Tuesdaystart"].blank?)
        start_timeh = params[:course]["Tuesdaystart"].to_i
        start_timem = params[:course]["Tuesdaystartm"].to_i
        end_timeh = params[:course]["Tuesdayend"].to_i
        end_timem = params[:course]["Tuesdayendm"].to_i
      end

      if weekday == 3 && !(params[:course]["Wednesdaystart"].blank?)
        start_timeh = params[:course]["Wednesdaystart"].to_i
        start_timem = params[:course]["Wednesdaystartm"].to_i
        end_timeh = params[:course]["Wednesdayend"].to_i
        end_timem = params[:course]["Wednesdayendm"].to_i
      end

      if weekday == 4 && !(params[:course]["Thursdaystart"].blank?)
        start_timeh = params[:course]["Thursdaystart"].to_i
        start_timem = params[:course]["Thursdaystartm"].to_i
        end_timeh = params[:course]["Thursdayend"].to_i
        end_timem = params[:course]["Thursdayendm"].to_i
      end

      if weekday == 5 && !(params[:course]["Fridaystart"].blank?)
        start_timeh = params[:course]["Fridaystart"].to_i
        start_timem = params[:course]["Fridaystartm"].to_i
        end_timeh = params[:course]["Fridayend"].to_i
        end_timem = params[:course]["Fridayendm"].to_i
      end

      if weekday == 6 && !(params[:course]["Saturdaystart"].blank?)
        start_timeh = params[:course]["Saturdaystart"].to_i
        start_timem = params[:course]["Saturdaystartm"].to_i
        end_timeh = params[:course]["Saturdayend"].to_i
        end_timem = params[:course]["Saturdayendm"].to_i
      end

      if weekday == 0 && !(params[:course]["Sundaystart"].blank?)
        start_timeh = params[:course]["Sundaystart"].to_i
        start_timem = params[:course]["Sundaystartm"].to_i
        end_timeh = params[:course]["Sundayend"].to_i
        end_timem = params[:course]["Sundayendm"].to_i
      end

      if start_timeh!=nil
        starttime = DateTime.new(date.year, date.month, date.day, start_timeh, start_timem)
        endtime = DateTime.new(date.year, date.month, date.day, end_timeh, end_timem)
        Booking.create(course_id: @course.id, start: starttime, endtime: endtime)
      end

    end

    if @course.save
      redirect_to @course, notice: 'Course was successfully created.'
    else
     render action: "new"
    end

  end

    # course_on = true
      
    #   case date.wday
    #   when 1 # Monday 
    #     if params[:course]["Mondaystart"].blank?
    #       course_on = false
    #     else
    #       start_timeh = params[:course]["Mondaystart"].to_i
    #       start_timem = params[:course]["Mondaystartm"].to_i
    #       end_timeh = params[:course]["Mondayend"].to_i
    #       end_timem = params[:course]["Mondayendm"].to_i 
    #     end  
    #   #   starttime = DateTime.new(date.year, date.month, date.day, start_timeh, start_timem)
    #   #   endtime = DateTime.new(date.year, date.month, date.day, end_timeh, end_timem)
    #   # b = Booking.create(course_id: @course.id, start: starttime, end: endtime) 

    #   when 2 # Tuesday
    #     if params[:course]["Tuesdaystart"].blank?
    #       course_on = false
    #     else
    #       start_timeh = params[:course]["Tuesdaystart"].to_i
    #       start_timem = params[:course]["Tuesdaystartm"].to_i
    #       end_timeh = params[:course]["Tuesdayend"].to_i
    #       end_timem = params[:course]["Tuesdayendm"].to_i 
    #     end
    #   #   starttime = DateTime.new(date.year, date.month, date.day, start_timeh, start_timem)
    #   #   endtime = DateTime.new(date.year, date.month, date.day, end_timeh, end_timem)
    #   # b = Booking.create(course_id: @course.
    #   when 3 # Wednesday
    #     if params[:course]["Wednesdaystart"].blank?
    #       course_on = false
    #     else
    #       start_timeh = params[:course]["Wednesdaystart"].to_i
    #       start_timem = params[:course]["Wednesdaystartm"].to_i
    #       end_timeh = params[:course]["Wednesdayend"].to_i
    #       end_timem = params[:course]["Wednesdayendm"].to_i 
    #     end
    #   when 4 # Thursday
    #     if params[:course]["Thursdaystart"].blank?
    #       course_on = false
    #     else
        
    #       start_timeh = params[:course]["Thursdaystart"].to_i
    #       start_timem = params[:course]["Thursdaystartm"].to_i
    #       end_timeh = params[:course]["Thursdayend"].to_i
    #       end_timem = params[:course]["Thursdayendm"].to_i 
    #     end
    #   when 5 # Friday
    #     if params[:course]["Fridaystart"].blank?
    #       course_on = false
    #     else
        
    #     start_timeh = params[:course]["Fridaystart"].to_i
    #     start_timem = params[:course]["Fridaystartm"].to_i
    #     end_timeh = params[:course]["Fridayend"].to_i
    #     end_timem = params[:course]["Fridayendm"].to_i 
    #     end
    #   when 6 # Saturday
    #     if params[:course]["Saturdaystart"].blank?
    #       course_on = false
    #     else
        
    #     start_timeh = params[:course]["Saturdaystart"].to_i
    #     start_timem = params[:course]["Saturdaystartm"].to_i
    #     end_timeh = params[:course]["Saturdayend"].to_i
    #     end_timem = params[:course]["Saturdayendm"].to_i 
    #     end
    #   when 7 # Sunday
    #     if params[:course]["Sundaystart"].blank?
    #       course_on = false
    #     else
    #       start_timeh = params[:course]["Sundaystart"].to_i
    #       start_timem = params[:course]["Sundaystartm"].to_i
    #       end_timeh = params[:course]["Sundayend"].to_i
    #       end_timem = params[:course]["Sundayendm"].to_i 
    #     end
    #   end

    #   if course_on == true
        
    #     Booking.create(course_id: @course.id, start: starttime, endtime: endtime)
    #   end


  # PUT /courses/1
  # PUT /courses/1.json
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


  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end


end

