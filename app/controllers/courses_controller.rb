class CoursesController < ApplicationController
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

    end1 = DateTime.new(params[:course]["endtime(1i)"].to_i, params[:course]["endtime(2i)"].to_i, params[:course]["endtime(3i)"].to_i, 23, 59)

    @classroom_bookings = Booking.for_classroom(params[:classroom][:classroom_id]).where('bookings.start > ?', start1).where('bookings.start < ?', end1)

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
        @course.bookings.build(start: starttime, endtime: endtime, classroom_id: params[:classroom][:classroom_id])
      end
    end

    if @course.save
      # raise @course.bookings.inspect
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

