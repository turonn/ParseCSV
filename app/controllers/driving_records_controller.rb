class DrivingRecordsController < ApplicationController
  before_action :set_driving_records, only: [:index]
  before_action :set_single_record, only: %i[update destroy]

  def index
    #driving_records_path
  end

  def new
    @record = DrivingRecord.new
    #new_driving_records_path
  end

  def create
    @record = DrivingRecord.new(driving_record_params)

    if @record.save
      redirect_to driving_records_path, notice: "Record created"
    else
      render 'new', alert: "did not save"
    end

  end

  def update
    if @record.save
      redirect_to driving_records_path, notice: "Record updated"
    else
      render 'new', alert: "did not save"
    end
  end

  def show
  end

  def destroy
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
    params.require(:driving_records).permit(:driver, :start_time, :end_time, :miles_driven)
  end

end