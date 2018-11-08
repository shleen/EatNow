class MenuItemsController < ApplicationController
  def new
  end

  def create
    m = MenuItem.new
    m.update(menu_items_params)
    puts params[:iName]
  end

  private

  def menu_items_params
    params.permit(:name, :price, :waiting_time, :halal, :vegetarian)
  end
end
