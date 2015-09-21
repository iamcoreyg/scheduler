class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.all
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show

  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
    @shifts = Shift.all
    @employees = Employee.all
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)
    puts 'yoooo'
    rangeStart = Date.strptime("#{schedule_params['start(2i)']}/#{schedule_params['start(3i)']}/#{schedule_params['start(1i)']}", "%m/%d/%Y")
    rangeEnd = Date.strptime("#{schedule_params['end(2i)']}/#{schedule_params['end(3i)']}/#{schedule_params['end(1i)']}", "%m/%d/%Y")

    @shifts = Shift.all
    @employees = Employee.all

    days = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)

    availability = [
        :mon_start,
        :mon_end,
        :tues_start,
        :tues_end,
        :wed_start,
        :wed_end,
        :thurs_start,
        :thurs_end,
        :fri_start,
        :fri_end,
        :sat_start,
        :sat_end,
        :sun_start,
        :sun_end
    ]

    @recent_schedule = Schedule.order("created_at").last

    if @recent_schedule.blank?
      new_schedule_id = 1
    else
      new_schedule_id = @recent_schedule.schedule_id + 1
    end

    days.each_with_index do |dayName, dayOfTheWeek|
      @shifts.each do |s|

        s.active_days.split(",")

        if( s.active_days.include? days[dayOfTheWeek] )
          startTime = time_to_int(s.start)
          endTime = time_to_int(s.end)

          @employees.each do |e|
            employee_start_time = time_to_int(e[availability[dayOfTheWeek]])
            employee_end_time = time_to_int(e[availability[dayOfTheWeek + 1]])

            if employee_start_time.blank? == false && employee_end_time.blank? == false
              if(startTime >= employee_start_time && endTime <= employee_end_time)
                @schedule = Schedule.create(:schedule_id => new_schedule_id, :shift_id => s.id, :employee => e.name, :date => Time.now, :start => rangeStart, :end => rangeEnd)
              end
            end

          end
        end
      end
    end

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to :action => "show", :id => new_schedule_id}
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.where(:schedule_id => params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:shift_id, :employee, :date, :schedule_id, :start, :end)
    end
end
