class CollectionsController < ApplicationController
  def new
  end

  def create
    # get collection point record
    c_pt = CollectionPoint.find(collection_params[:number])

    # no collection point found
    if c_pt.nil?
      flash[:danger] = "No collection point found. Please try again..."
      redirect_back fallback_location: root_path
    end

    options = {
      body: {
        number: c_pt.number,
        x: c_pt.x,
        y: c_pt.y,
        order_id: collection_params[:order_id]
      }
    }

    res = HTTParty.post(@RPI, options)
    puts res.body

    redirect_back fallback_location: root_path
  end

  private

  def collection_params
    params.permit(:number, :order_id)
  end
end
