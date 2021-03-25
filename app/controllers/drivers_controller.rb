class DriversController < ApplicationController
  before_action :set_sorted_drivers, only: [:index]
  before_action :set_single_driver, only: [:edit, :update, :destroy]

  def index
    #drivers_path
  end

  def new
    @driver = Driver.new
    #new_drivers_path
  end

  def create
    #called fromt he new view
    @driver = Driver.new(driver_params)

    if @driver.save
      redirect_to drivers_path, notice: "driver created"
    else
      redirect_to new_driver_path, alert: @driver.errors.full_messages
    end

  end

  def edit
    #edit_driver_path
  end

  def update
    #Called from the edit view
    if @driver.update(driver_params)
      redirect_to drivers_path, notice: "driver updated"
    else
      render :edit, alert: @driver.errors.full_messages
    end
  end

  def show
  end

  def destroy
    if @driver.driving_records.count != 0
      redirect_to drivers_path, alert: "Cannot delete driver with assigned trips."
    elsif @driver.destroy
      redirect_to drivers_path, notice: "driver deleted"
    else
      redirect_to drivers_path, alert: @driver.errors.full_messages
    end
    
    #drivers_path DELETE
  end

  private

  def set_sorted_drivers
    @drivers = Driver.all
    @drivers = @drivers.sort_by { |driver| [total_miles(driver)] }
    #turn this into a scope?
  end

  def total_miles(driver)
    #this is a copied method from helper...
    #I wonder if there is a way to use this in the helper method or somehow
    #make it so we aren't repeating ourselves
    total = 0.0
    driver.driving_records.each do |record|
      next if record.trip_speed.to_f < 5 || record.trip_speed.to_f > 100
      total += record.miles_driven.to_f
    end
    -total
  end

  def set_single_driver
    @driver = Driver.find(params[:id])
  end

  def driver_params
    params.require(:driver).permit(:name)
  end

end