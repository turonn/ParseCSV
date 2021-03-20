class UploadController < ApplicationController

  def index
  end

  def import
    redirect_to upload_index_path, notice: "We got 'em, boss!"
  end
end