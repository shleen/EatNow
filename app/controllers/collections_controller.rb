class CollectionsController < ApplicationController
  def new
    @collection_points = CollectionPoint.all
  end

  def create
    # get collection point record
    c_pt = CollectionPoint.find(params[:number])

    # no collection point found
    if c_pt.nil?
      flash[:danger] = "No collection point found. Please try again..."
      redirect_back fallback_location: root_path
    end

    options = {
      body: {
        number: c_pt.number,
        x: c_pt.x,
        y: c_pt.y
      }
    }

    HTTParty.post(@RPI, options)
  end
end
