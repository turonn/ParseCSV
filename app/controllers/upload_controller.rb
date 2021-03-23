class UploadController < ApplicationController

  def index
  end

  def import
    redirect_to driving_records_path, notice: "We got 'em, boss!"
  end
end