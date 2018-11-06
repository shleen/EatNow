class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_up_instance_variables

  def index
  end

  private

  def set_up_instance_variables
    # Raspberry PI URL
    @RPI = "https://d3116b87.ngrok.io"
  end
end
