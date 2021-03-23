class DrivingRecordsController < ApplicationController
  before_action :set_driving_records, only: [:index]
  before_action :set_single_record, only: [:edit, :update, :destroy]

  def index
    #driving_records_path
  end

  def new
    @record = DrivingRecord.new
    #new_driving_records_path
  end

  def create
    @record = DrivingRecord.new(driving_record_params)

    #if we can save the record with those params...
    if @record.save
      redirect_to driving_records_path, notice: "record created"
    else
      render :new, alert: @record.errors.full_messages
    end

  end

  def edit
    
  end

  def update

    if @record.update(driving_record_params)
      redirect_to driving_records_path, notice: "record updated"
    else
      render :edit, alert: @record.errors.full_messages
    end
  end

  def show
  end

  def destroy
    if @record.destroy
      redirect_to driving_records_path, notice: "record deleted"
    else
      redirect_to driving_records_path, alert: @record.errors.full_messages
    end
    
    #driving_records_path DELETE
  end

  private

  def set_driving_records
    @drivingRecords = DrivingRecord.all
  end

  def set_single_record
    @record = DrivingRecord.find(params[:id])
  end

  def driving_record_params
    params.require(:driving_record).permit(:driver_id, :start_time, :end_time, :total_time, :miles_driven)
  end

end