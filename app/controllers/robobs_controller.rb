class RobobsController < ApplicationController
  def edit
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
end
