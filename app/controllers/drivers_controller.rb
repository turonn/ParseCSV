class DriversController < ApplicationController
  before_action :set_drivers, only: [:index]
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
      render :new, alert: "did not save"
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
      render :edit, alert: "did not update"
    end
  end

  def show
  end

  def destroy
    if @driver.driving_records.count != 0
      redirect_to drivers_path, alert: "Driver has trips assigned. Cannot delete."
    elsif @driver.destroy
      redirect_to drivers_path, notice: "driver deleted"
    else
      redirect_to drivers_path, alert: "driver not deleted"
    end
    
    #drivers_path DELETE
  end

  private

  def set_drivers
    @drivers = Driver.all
  end

  def set_single_driver
    @driver = Driver.find(params[:id])
  end

  def driver_params
    params.require(:driver).permit(:name)
  end

end