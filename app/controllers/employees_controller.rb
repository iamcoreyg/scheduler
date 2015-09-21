class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :days, only: [:edit, :new, :create]
  before_action :hours, only: [:edit, :new]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    i = 0
    while i < @all_days.length - 1
      input = @employee[@all_days[i]]

      if input.blank? == false
        startTime = input.split('-')[0]
        endTime = input.split('-')[1]
        @employee[@all_days[i]] = startTime
        @employee[@all_days[i+1]] = endTime
      end
      i += 2
    end

    #####

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def hours
      @hours = create_hours(:start_time => 5.hours, :end_time => 22.hours)
    end

    def days
      @start_days = [
          :mon_start,
          :tues_start,
          :wed_start,
          :thurs_start,
          :fri_start,
          :sat_start,
          :sun_start,
      ]

      @all_days = [
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
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:name, :position_title, :is_manager, :mon_start, :mon_end, :tues_start, :tues_end, :wed_start, :wed_end, :thurs_start, :thurs_end, :fri_start, :fri_end, :sat_start, :sat_end, :sun_start, :sun_end)
    end
end
