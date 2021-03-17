class DrivingRecordsController < ApplicationController
  before_action :set_driving_records
  
  def index
  end

  private

  def set_driving_records
    @drivingRecords = DrivingRecord.all
  end
end