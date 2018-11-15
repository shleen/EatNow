class RobobsController < ApplicationController
  before_action :set_up_instance_variables

  def index; end

  def edit; end

  def move
    options = {
      body: {
        x: params[:x],
        y: params[:y]
      }
    }

    begin
      res = HTTParty.post(@r.url, options)
      puts res.body
    rescue
    end

    redirect_back fallback_location: root_path
  end

  def update
    if @r.update(robob_params)
      flash[:notice] = 'All gud!'
    else
      flash[:error] = 'Damn. Something went bad. Try again?'
    end

    redirect_back fallback_location: root_path
  end

  private

  def robob_params
    params.require(:robob).permit(:url)
  end

  def set_up_instance_variables
    @r = Robob.first
  end
end
