class UploadController < ApplicationController

  def index
  end

  def import
    file = params[:file]

    if file == nil
      redirect_to upload_index_path, alert: "select file to upload"
    else
      #send to a "sort" method that uploads drivers and records
      alert = []
      File.foreach(file).each do |line|
        arr = line.split(' ')

        case arr[0]
        when "Driver"
          if arr.length == 2
            Driver.create({
              name: arr[1]
            })
          else
            alert << "Not 2 args Driver error with line " + line
          end

        when "Trip"
          if arr.length == 5
            DrivingRecord.create({
              driver: Driver.find_by(name: arr[1]),
              start_time: arr[2],
              end_time: arr[3],
              miles_driven: arr[4]
            })
          else
            alert << "Not 4 args Trip error with line " + line
          end

        else
          alert << "Not Trip/Driver error on " + line
        end


      end
      redirect_to drivers_path, notice: "files imported", alert: alert.each
    end
  end
end